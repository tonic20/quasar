FactoryGirl.define do
  factory :user do
    sequence(:nickname) { |n| "user_#{n}" }
    sequence(:email)    { |n| "email_#{n}@email.com" }
    
    first_name            'Test'
    last_name             'User'
    password              '123456'
    password_confirmation '123456'

    trait(:reader)    { role 'reader' }
    trait(:admin)     { role 'admin' }
    trait(:moderator) { role 'moderator' }
    
    factory :reader_user do
      role 'reader'
    end
    
    factory :admin_user do
      role 'admin'
    end
    
    factory :moderator_user do
      role 'moderator'
    end
  end
end
