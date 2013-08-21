# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :review do
    user_id 1
    book_id 1
    head "MyString"
    content "MyText"
    approved 1
  end
end
