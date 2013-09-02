class Book < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :season
    has_many :rates, :class_name => BookRate
    has_many :comments, :as => :commentable
    has_many :tracks, :as => :trackable
    has_many :book_tracks

    scope :short_list, -> {where(:short_list => 1)}
    
    def self.search(search_string)
    end

  def quoted_title
    "&laquo#{self.title}&raquo;".html_safe
  end
        
end
