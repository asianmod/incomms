class Product < ApplicationRecord

  belongs_to :profile
  has_many :comments
  before_create :generate_token
  has_many :trading_logs
  has_one :p
  enum status: { stand_by: 0, buying: 5 }

  private

  def generate_token    
    self.token = SecureRandom.alphanumeric(6).upcase
  end
end