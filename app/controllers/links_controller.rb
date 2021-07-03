# frozen_string_literal: true

class LinksController < ApplicationController
  def show
    link = find_link
    VisitsHandler.new(link, request.ip).call

    redirect_to(link.long_url)
  end

  private

  def find_link
    Link.find_by!(token: params[:token])
  end
end
