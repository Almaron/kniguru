namespace :news do

  desc "Extracting news images"
  task :extract_images => :environment do
    News.all.each do |news|
      begin
        doc = Nokogiri::HTML(news.text)
        if doc.at_css("a img")
          news.remote_image_url = doc.at_css("a img")[:src]
          news.save
          puts "#{news.id} success"
        end
      rescue ArgumentError => e
        puts "#{news.id} failed"
      end
    end
  end

end