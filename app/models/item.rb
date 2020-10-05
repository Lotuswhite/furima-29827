class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :prifecture
  belongs_to_active_hash :shopping_status
  belongs_to_active_hash :scheduled
  belongs_to_active_hash :status

  validates :image, :name, :info, :price, presence: true

  with_options format: { with: /\A[a-z0-9]+\z/i.freeze } do
    validates :price, inclusion: { in: 300..9_999_999 }
  end

  validates :category_id, :status_id, :shopping_status_id, :prifecture_id, :scheduled_id, numericality: { other_than: 0 }

  #Association
  belongs_to :user
  has_one :order
  has_one_attached :image

end
