class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery
  belongs_to_active_hash :day
  belongs_to_active_hash :state

  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 0 }
  validates :status_id, numericality: { other_than: 0 }
  validates :shopping_status_id, numericality: { other_than: 0 }
  validates :prifecture_id, numericality: { other_than: 0 }
  validates :scheduled_id, numericality: { other_than: 0 }

  VALID_PRICE_REGEX = /\A[a-z0-9]+\z/i
  validates :price, inclusion: {in: 300..9999999 }, format: {with: VALID_PRICE_REGEX} 

  belongs_to :user
  has_one_attached :image

end
