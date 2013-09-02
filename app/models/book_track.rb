class BookTrack < ActiveRecord::Base
    
    belongs_to :user
    belongs_to :book

    scope :will_read, -> {where(:status => 0)}
    scope :read, -> {where(:status => 1)}
end
