FactoryBot.define do
  factory :management_comment, class: ManagementComment do
    content { Faker::Lorem.characters(number: 300) }
  end

  factory :sale_comment, class: SaleComment do
    content { Faker::Lorem.characters(number: 300) }
  end
end
