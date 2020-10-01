class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :area
  belongs_to_active_hash :delivery
  belongs_to_active_hash :day
  belongs_to_active_hash :state

  validates :image, :name, :info, presence: true

  with_options presence: true, format: { with: /\A[a-z0-9]+\z/i.freeze } do
    validates :price, inclusion: { in: 300..9_999_999 }
  end

  validates :category_id,:status_id,:shopping_status_id,:prifecture_id,:scheduled_id, numericality: { other_than: 0 }
  
  belongs_to :user
  has_one_attached :image
end
