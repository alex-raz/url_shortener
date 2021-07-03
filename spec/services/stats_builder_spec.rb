# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StatsBuilder, type: :service do
  describe '#call' do
    def method_call(link)
      described_class.new(link).call
    end

    it 'builds visits statistic for a given Link' do
      link = create(:link, long_url: 'http://example.com/page')
      create_list(:visit, 2, link: link, ip: '108.122.75.87')
      create_list(:visit, 3, link: link, ip: '4.212.78.21')
      create(:visit, link: link, ip: '63.98.4.0')

      result = method_call(link)

      expect(result).to eq(
        {
          total_clicks: 6,
          uniq_ips: 3,
          ips_frequency: {
            '108.122.75.87' => 2,
            '4.212.78.21' => 3,
            '63.98.4.0' => 1
          }
        }
      )
    end
  end
end
