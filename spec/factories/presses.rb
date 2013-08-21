# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :press do
    head "MyString"
    content "MyText"
    paper_name "MyString"
    paper_url "MyString"
  end
end
