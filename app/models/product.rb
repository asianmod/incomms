class Product < ApplicationRecord

  validates :name, :item_desc, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0}
  validates :name, length: { minimum: 5, maximum: 150 }

  belongs_to :profile
  has_many :comments
  before_create :generate_token
  #before_save :set_status
  has_many :trading_logs
  has_one :product
  enum status: { stand_by: 0, buying: 5 }

  private

  def set_status
    self.status = 0
  end

  def generate_token    
    self.token = SecureRandom.alphanumeric(6).upcase
  end
end