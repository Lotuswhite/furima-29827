class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery
  belongs_to_active_hash :day
  belongs_to_active_hash :state


  belongs_to :user
  has_one_attached :image

end
