FactoryBot.define do
  factory :item do
    name { '写真' }
    description { '美しい景観の写真です。世界に一つ' }
    category_id { 3 }
    status_id { 3 }
    beard_id { 2 }
    area_id { 30 }
    days_id { 2 }
    price { 2000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
