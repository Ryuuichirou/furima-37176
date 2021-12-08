FactoryBot.define do
  factory :user do
    nick_name              { 'test' }
    first_name             { '山田' }
    last_name              { '陸太郎' }
    first_name_kana        { 'ヤマダ' }
    last_name_kana         { 'リクタロウ' }
    birthday               { '1999-02-01' }
    email                  { Faker::Internet.free_email }
    password               { 'abc111' }
    password_confirmation  { password }
  end
end
