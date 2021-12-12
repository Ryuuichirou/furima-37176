FactoryBot.define do
  factory :purchase_history_address do
    token                 {"tok_abcdefghijk00000000000000000"}
    postal_cord           { '123-4567' }
    prefectures_id        { 2 }
    municipalities        { '横浜市緑区' }
    house_number          { '青山1-1' }
    building_name         { '東京ハイツ' }
    telephone_number      { '09012345678' }
    association :user, :item
  end
end
