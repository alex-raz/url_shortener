# frozen_string_literal: true

class LinksController < ApplicationController
  def show
    link = find_link
    VisitsHandler.new(link, request.ip).call

    redirect_to(link.long_url)
  end

  def create
    link = LinksCreator.new(params).call

    if link.persisted?
      render plain: link_long_url(link.token)
    else
      render plain: link.errors.first.full_message, status: :unprocessable_entity
    end
  end

  def stats
    link = find_link
    stats = StatsBuilder.new(link).call

    render json: stats.to_json
  end

  private

  def find_link
    Link.find_by!(token: params[:token])
  end
end
