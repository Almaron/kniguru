#encoding: utf-8
namespace :news do

  desc "Extracting news images"
  task :extract_images => :environment do
    News.all.each do |news|
      begin
        doc = Nokogiri::HTML(news.text)
        if doc.at_css("a img")
          news.remote_image_url = doc.at_css("a img")[:src]
          news.save
        end
      end
    end
  end

end