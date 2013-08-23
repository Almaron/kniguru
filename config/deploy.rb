 # Для работы rvm
require 'bundler/capistrano' # Для работы bundler. При изменении гемов bundler автоматически обновит все гемы на сервере, чтобы они в точности соответствовали гемам разработчика. 

server "66.225.201.127", :web, :app, :db, primary: true
set :application, "kniguru"
set :user, "rails"
set :deploy_to, "/home/#{user}/www/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, false
set :use_sudo, false
set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid, "#{deploy_to}/current/tmp/pids/unicorn.pid"

set :rvm_ruby_string, '2.0.0-p247@kniguru'
set :bundle_dir, ''
set :bundle_flags, '--system --quiet'

require 'rvm/capistrano'

set :scm, :git
set :repository,  "https://github.com/Almaron/kniguru.git"
set :branch, "master"


default_run_options[:pty] = true
ssh_options[:forward_agent] = true

before 'deploy:setup', 'rvm:install_rvm', 'rvm:install_ruby'

after "deploy", "deploy:cleanup"
require 'sidekiq/capistrano'

# Далее идут правила для перезапуска unicorn. Их стоит просто принять на веру - они работают.
# В случае с Rails 3 приложениями стоит заменять bundle exec unicorn_rails на bundle exec unicorn
namespace :deploy do
  #%w[start stop restart].each do |command|
  #  desc "#{command} unicorn server"
  #  task command, roles: :app, except: {no_release: true} do
  #    run "sudo /etc/init.d/unicorn_#{application} #{command}"
  #  end
  #end

  task :restart do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end
  task :start do
    run "bundle exec unicorn -c #{unicorn_conf} -E #{rails_env} -D"
  end
  task :stop do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/conf.d/#{application}.conf"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}."
    run "mkdir -p #{shared_path}/config"
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  task :upload_link do
    run "rm -rf #{release_path}/public/uploads"
    run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  end
  after "deploy", "deploy:upload_link"
  after "deploy", "deploy:migrate"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse github/master`
      puts "WARNING: HEAD is not the same as github/master"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"

  task :chown do
    run "chown -R rails:nginx #{current_path}"
  end
  after "deploy", "deploy:chown"

end