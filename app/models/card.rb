# == Schema Information
#
# Table name: cards
#
#  id         :integer          not null, primary key
#  user_id    :string
#  card_id    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Card < ActiveRecord::Base
  belongs_to :user

  validates :card_id, presence: true, uniqueness: true
end
