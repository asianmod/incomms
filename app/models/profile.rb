class Profile < ApplicationRecord

  validates :name, :sector, :region, 
            :company, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :name, length: { minimum: 2, maximum: 150 }

  has_one_attached :picture
  belongs_to :user
  has_many :comments
  has_many :log_comments
  has_many :products
  has_many :trading_logs
end
