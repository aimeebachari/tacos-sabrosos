class TacoShop < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true

  has_many :reviews
end
