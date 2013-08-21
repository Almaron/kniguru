# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :writing do
    head "MyString"
    content "MyText"
    paper_name "MyString"
    paper_url "MyString"
    published_on "2013-08-21"
  end
end
