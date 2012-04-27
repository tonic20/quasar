# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :document do
    title       "MyString"
    description "MyText"
    content     "MyLongLongLongText"
    
    creator
  end
end
