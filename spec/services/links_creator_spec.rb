# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LinksCreator, type: :service do
  describe 'Token uniquiness' do
    def stub_token_builder(thing_to_build:)
      instance = instance_double(TokenBuilder)
      allow(TokenBuilder).to receive(:new).and_return(instance)
      allow(instance).to receive(:call).and_return(thing_to_build)

      instance
    end

    it 'attempts to ensure uniquiness on token generation stage' do
      create(:link, token: 'the-same-token')
      token_builder_instance = stub_token_builder(thing_to_build: 'the-same-token')

      link = described_class.new({ long_url: 'http://example.com' }).call

      expect(link).not_to be_valid
      expect(token_builder_instance).to have_received(:call).exactly(3).times
    end
  end
end
