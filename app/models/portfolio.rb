# == Schema Information
#
# Table name: portfolios
#
#  id                     :integer          not null, primary key
#  name                   :string
#  description            :text
#  initial_value          :float
#  returns_sinceinception :float
#  expected_returns       :float
#  expected_volatility    :float
#  user_id                :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Portfolio < ApplicationRecord
    has_many :portfolio_allocations, :dependent => :destroy
    belongs_to :user
end
