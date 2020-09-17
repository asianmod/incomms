class TradingLog < ApplicationRecord

  belongs_to :product
  has_many :log_comments
  belongs_to :profile
  enum status: {opened: 0, canceled: 50, confirmed: 100}

  validates :trade_log, :status, presence: true
end
