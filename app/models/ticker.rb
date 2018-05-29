# == Schema Information
#
# Table name: tickers
#
#  id            :integer          not null, primary key
#  symbol        :string
#  category      :string
#  security_type :string
#  url           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Ticker < ApplicationRecord
    has_many :ticker_stats, :dependent => :destroy
    has_many :portfolio_allocations, :dependent => :destroy
    has_many :user_tickerlists, :dependent => :destroy
end
