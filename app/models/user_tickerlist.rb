# == Schema Information
#
# Table name: user_tickerlists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  ticker_id  :integer
#  tag_id     :integer
#  watchlist  :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserTickerlist < ApplicationRecord
    belongs_to :ticker
    belongs_to :user
    belongs_to :tag, :required => false
end
