# frozen_string_literal: true

class VisitsHandler
  def initialize(link, ip)
    @link = link
    @ip = ip
  end

  def call
    @link.visits.create(ip: @ip)
  end
end
