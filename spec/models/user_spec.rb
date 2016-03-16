# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:orders) }
  it { should have_many(:deducted_orders) }
  it { should have_many(:remaining_orders) }
end
