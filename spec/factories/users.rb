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

    trait :with_management_profile do
      after :build do |user|
        build(:management_profile, user: user)
      end
    end

    trait :with_sale_profile do
      after :build do |user|
        build(:sale_profile, user: user)
      end
    end

    trait :with_production_profile do
      after :build do |user|
        build(:production_profile, user: user)
      end
    end

    trait :with_development_profile do
      after :build do |user|
        build(:development_profile, user: user)
      end
    end
  end
end
