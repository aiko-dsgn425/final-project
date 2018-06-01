# == Schema Information
#
# Table name: user_tickerlists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  ticker_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserTickerlist < ApplicationRecord
    validates :user_id, :ticker_id, presence: true
    validates :user_id, uniqueness: {scope: :ticker_id}
    belongs_to :ticker
    belongs_to :user
end
