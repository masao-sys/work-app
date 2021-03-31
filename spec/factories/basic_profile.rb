FactoryBot.define do
  factory :management_profile, class: BasicProfile do
    name { Faker::Name.name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    gender { BasicProfile.genders.keys.sample }
    department { 'management' }
  end

  factory :sale_profile, class: BasicProfile do
    name { Faker::Name.name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    gender { BasicProfile.genders.keys.sample }
    department { 'sales' }
  end

  factory :production_profile, class: BasicProfile do
    name { Faker::Name.name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    gender { BasicProfile.genders.keys.sample }
    department { 'production' }
  end

  factory :development_profile, class: BasicProfile do
    name { Faker::Name.name }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 65) }
    gender { BasicProfile.genders.keys.sample }
    department { 'development' }
  end
end
