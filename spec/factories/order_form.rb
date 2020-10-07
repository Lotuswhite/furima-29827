FactoryBot.define do
  factory :order_form do

    token                          { "tok_abcdefghijk00000000000000000" }
    postnumber                     { '123-1234' }
    prifecture_id                  { '2' }
    city                           { '山形市' }
    housenumber                    { '1-1-1' }
    housename                      { 'ビル' }
    phonenumber                    { '12345678901' }

    # after(:build) do |item|
    #   item.image.attach(io: File.open('public/images/furima-intro01.png'), filename: 'furima-intro01.png')
    # end

     association :user
     association :item
  end
end
