FactoryGirl.define do
  factory :user do
    sequence(:nickname) { |n| "user_#{n}" }
    sequence(:email)    { |n| "email_#{n}@email.com" }
    
    first_name            'Test'
    last_name             'User'
    password              '123456'
    password_confirmation '123456'
    role                  'reader'
    
    trait(:admin)     { role 'admin' }
    trait(:moderator) { role 'moderator' }
    
    factory :admin_user,     traits: [ :admin ]
    factory :moderator_user, traits: [ :moderator]
  end
end
