FactoryBot.define do
  factory :user do
    nickname                { 'abe' }
    email                   { Faker::Internet.email }
    password = Faker::Internet.password(min_length: 6)
    password                { password }
    password_confirmation   { password }
    family_name             { '佐藤' }
    first_name              { '太郎' }
    family_name_kana        { 'サトウ' }
    first_name_kana         { 'タロウ' }
    birthday                { Faker::Date.between_except(from: 1.year.ago, to: 1.year.from_now, excepted: Date.today) }
  end
end
