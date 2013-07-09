class News < ActiveRecord::Base
    
    has_many :comments, :as => :commentable    
    has_many :tracks, :as => :trackable
    
    mount_uploader :image, NewsUploader
end
