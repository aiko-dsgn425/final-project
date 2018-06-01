# == Schema Information
#
# Table name: ticker_stats
#
#  id              :integer          not null, primary key
#  sharpe_ratio    :float
#  annual_returns  :float
#  ticker_id       :integer
#  annualized_risk :float
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

class TickerStat < ApplicationRecord
    validates :sharpe_ratio, :annual_returns, :ticker_id, :annualized_risk, :user_id, presence: true
    belongs_to :ticker
end
