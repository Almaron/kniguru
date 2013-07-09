class Book < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :season
    has_many :rates, :class_name => BookRate
    has_many :comments, :as => :commentable
    
    def self.search(search_string)
    end    
        
end
