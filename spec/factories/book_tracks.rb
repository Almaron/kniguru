# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :book_track do
    book_id 1
    user_id 1
    track_type 1
  end
end
