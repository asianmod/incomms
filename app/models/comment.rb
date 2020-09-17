class Comment < ApplicationRecord

  belongs_to :product
  belongs_to :profile
  
  validates :replay, presence: true
  validates :replay, length: { minimum: 2, maximum: 300 }
end
