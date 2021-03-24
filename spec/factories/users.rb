FactoryBot.define do
  factory :admin do
    email { Faker::Internet.email }
    password { 'password' }
    admin { true }
  end
end
