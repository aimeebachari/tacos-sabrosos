class Review < ApplicationRecord
  belongs_to :user
  belongs_to :taco_shop

  validates :body, presence: true
end
