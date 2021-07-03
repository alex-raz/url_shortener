# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Visit, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:link) }
  end
end

# == Schema Information
#
# Table name: visits
#
#  id         :bigint           not null, primary key
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link_id    :bigint           not null
#
# Indexes
#
#  index_visits_on_link_id  (link_id)
#
# Foreign Keys
#
#  fk_rails_...  (link_id => links.id)
#
