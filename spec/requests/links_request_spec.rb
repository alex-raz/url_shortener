# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Links', type: :request do
  describe 'GET /urls/{token}' do
    let(:token) { 'uniq_token' }

    context 'when token does NOT exists' do
      it 'responds with 404' do
        expect do
          get "/urls/#{token}"
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when token exists in DB' do
      it 'redirects to specified long URL; increments Visits count' do
        link = create(:link, long_url: 'http://example.com/page', token: token)
        expect(Visit.count).to eq(0) # sanity check

        get "/urls/#{token}"

        expect(response).to have_http_status(:found)
        expect(link.visits.count).to eq(1)
        expect(link.visits.last.ip).to eq('127.0.0.1')
        expect(response).to redirect_to('http://example.com/page')
      end
    end
  end
end
