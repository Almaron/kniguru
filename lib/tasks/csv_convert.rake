#encoding: utf-8

namespace :users do

  task :import_data => :environment do
    in_file = Rails.root.join('public','kniguru_usermeta.csv')
    file = File.open(in_file)
    user_data = {}
    file.each_line do |line|
      params = line.gsub("\"","").split(";")
      user_data[params[0]] ||= {}
      user_data[params[0]][:id] ||= params[0].to_i
      user_data[params[0]][params[1].to_sym] = params[2]
    end
    file.close
    main_data = user_data.map {|user| user[1]}
    main_data.each do |line|
      if (user = Profile.find_by(:user_id => line[:id]))
        line.delete :id
        line.delete :birthday
        line.delete :books
        user.update(line)
      end
    end
  end

end