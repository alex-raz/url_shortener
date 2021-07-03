# frozen_string_literal: true

Rails.application.routes.draw do
  get '/urls/:token', to: 'links#show', as: :link_long
  post '/urls', to: 'links#create'
  get '/urls/:token/stats', to: 'links#stats'
end
