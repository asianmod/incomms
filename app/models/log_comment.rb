class LogComment < ApplicationRecord

  validates :private_message, presence: true
  validates :private_message, length: { minimum: 1, maximum: 300 }

  belongs_to :trading_log
  belongs_to :profile
end
