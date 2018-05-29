# == Schema Information
#
# Table name: portfolio_allocations
#
#  id                :integer          not null, primary key
#  portfolio_id      :integer
#  ticker_id         :integer
#  percent_allocated :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class PortfolioAllocation < ApplicationRecord
    belongs_to :ticker
    belongs_to :portfolio
end
