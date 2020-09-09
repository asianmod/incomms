class LogComment < ApplicationRecord
  belongs_to :trading_log
  belongs_to :profile
end
