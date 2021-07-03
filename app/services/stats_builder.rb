# frozen_string_literal: true

class StatsBuilder
  def initialize(link)
    @link = link
  end

  def call
    visits = @link.visits

    {
      total_clicks: visits.count,
      uniq_ips: visits.select(:ip).distinct.count,
      ips_frequency: visits.select(:ip).group(:ip).count
    }
  end
end
