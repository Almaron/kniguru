class Profile < ActiveRecord::Base
  serialize :hide_fields, Array
  serialize :favourite_books, Array
  belongs_to :user
    
end
