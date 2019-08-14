class Review < ApplicationRecord
  belongs_to :restaurant

  validates :restaurant, :content, :rating, presence: true
  validates :rating, inclusion: { in: (0..5).to_a }
end
