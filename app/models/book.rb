class Book < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :season
    has_many :rates, :class_name => BookRate
    has_many :comments, :as => :commentable

    scope :short_list, -> {where(:short_list => 1)}
    
    def self.search(search_string)
    end    
        
end
