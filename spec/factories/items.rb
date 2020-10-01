FactoryBot.define do
  factory :item do
    name                     { 'ばなな' }
    info                     { '果物です。' }
    category_id              { 2 }
    status_id                { 2 }
    shopping_status_id       { 2 }
    prifecture_id            { 2 }
    scheduled_id              { 2 }
    price                    { '100000' }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/furima-intro01.png'), filename: 'furima-intro01.png')
    end

    association :user
  end
end
