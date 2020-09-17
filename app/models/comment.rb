class Comment < ApplicationRecord
  
  validates :replay, presence: true

  belongs_to :product
  belongs_to :profile
end
