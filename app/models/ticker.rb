# == Schema Information
#
# Table name: tickers
#
#  id         :integer          not null, primary key
#  symbol     :string
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ticker < ApplicationRecord
    validates :symbol, :url, presence: true
    validates :symbol, uniqueness: true
    has_many :ticker_stats, :dependent => :destroy
    has_many :portfolio_allocations, :dependent => :destroy
    has_many :user_tickerlists, :dependent => :destroy
end
