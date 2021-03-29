FactoryBot.define do
  factory :admin, class: User do
    email { Faker::Internet.email }
    password { 'password' }
    admin { true }
  end

  factory :user, class: User do
    email { Faker::Internet.email }
    password { 'password' }
    admin { false }
  end
end
