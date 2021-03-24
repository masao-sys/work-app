FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'password' }
    admin { true }
  end
end
