class LogComment < ApplicationRecord

  validates :private_message, presence: true
  
  belongs_to :trading_log
  belongs_to :profile
end
