FactoryBot.define do
  factory :sale do
    title { Faker::Lorem.characters(number: 10) }
    content { Faker::Lorem.characters(number: 300) }
    after(:build) do |sale|
      sale.images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image1.png')), filename: 'test_image1.png', content_type: 'image/png')
    end

    factory :sale_four_attach do
      after(:build) do |sale_four_attach|
        sale_four_attach.images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image1.png')), filename: 'test_image1.png', content_type: 'image/png')
        sale_four_attach.images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image2.png')), filename: 'test_image2.png', content_type: 'image/png')
        sale_four_attach.images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image3.png')), filename: 'test_image3.png', content_type: 'image/png')
        sale_four_attach.images.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image4.png')), filename: 'test_image4.png', content_type: 'image/png')
      end
    end
  end
end
