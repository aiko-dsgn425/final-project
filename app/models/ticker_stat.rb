# == Schema Information
#
# Table name: ticker_stats
#
#  id              :integer          not null, primary key
#  sharpe_ratio    :float
#  annual_returns  :float
#  ticker_id       :integer
#  annualized_risk :float
#  expense_ratio   :float
#  current         :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class TickerStat < ApplicationRecord
    belongs_to :ticker
end
