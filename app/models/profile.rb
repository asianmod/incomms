class Profile < ApplicationRecord
  has_one_attached :picture
  belongs_to :user
  has_many :comments
  has_many :log_comments
  has_many :products
  has_many :trading_logs
end
