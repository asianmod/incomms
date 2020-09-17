class TradingLog < ApplicationRecord

  validates :status, presence: true
  
  belongs_to :product
  has_many :log_comments
  belongs_to :profile
  enum status: {opened: 0, canceled: 50, confirmed: 100}
end
