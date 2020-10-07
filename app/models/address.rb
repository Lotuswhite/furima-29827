class Address < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prifecture

  #Association

 belongs_to :order, dependent: :destroy

end
