FactoryBot.define do
  factory :management_profile, class: BasicProfile do
    name { Faker::Name.name }
    birthday { '2000-01-01' }
    gender { 'male' }
    department { 'management' }
  end

  factory :sale_profile, class: BasicProfile do
    name { Faker::Name.name }
    birthday { '1998-07-07' }
    gender { 'female' }
    department { 'sales' }
  end

  factory :production_profile, class: BasicProfile do
    name { Faker::Name.name }
    birthday { '2000-01-01' }
    gender { 'male' }
    department { 'production' }
  end

  factory :development_profile, class: BasicProfile do
    name { Faker::Name.name }
    birthday { '1998-07-07' }
    gender { 'female' }
    department { 'development' }
  end
end
