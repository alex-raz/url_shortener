# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'validations' do
    let(:subject) { build(:link) }

    it { is_expected.to validate_uniqueness_of(:token) }
    it { is_expected.to validate_presence_of(:token) }

    it { is_expected.to validate_presence_of(:long_url) }

    describe 'long URL validation' do
      context 'when valid' do
        def expect_to_be_valid(url)
          expect(build(:link, long_url: url)).to be_valid
        end

        it { expect_to_be_valid('https://example.com') }
        it { expect_to_be_valid('http://example.com') }
      end

      context 'when invalid' do
        def expect_not_to_be_valid(url)
          expect(build(:link, long_url: url)).not_to be_valid
        end

        it { expect_not_to_be_valid('invalid') }
        it { expect_not_to_be_valid('htt://invalid') }

        it 'adds error' do
          link = build(:link, long_url: 'invalid')

          link.valid?

          expect(link.errors.first.full_message).to eq('Long url is not a valid URL')
        end
      end
    end
  end

  describe 'associations' do
    it { is_expected.to have_many(:visits).dependent(:destroy) }
  end
end

# == Schema Information
#
# Table name: links
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  token      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_links_on_token  (token) UNIQUE
#
