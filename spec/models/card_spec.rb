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

require 'rails_helper'

RSpec.describe Card, type: :model do
  it { should belong_to :user }
end
