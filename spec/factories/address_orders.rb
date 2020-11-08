FactoryBot.define do
  factory :address_order do
    token {"tok_abcdefghijk00000000000000000"}
    postcode {"234-5678"}
    prefecture_id {26}
    municipality {"京都市四条区"}
    address {"1-2-3"}
    building_name {"立川ビルディング６０５号室"}
    phone_number {99087654321}
  end
end
