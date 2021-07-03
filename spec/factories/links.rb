# frozen_string_literal: true

FactoryBot.define do
  factory :link do
    long_url { Faker::Internet.url }
    token { Faker::Internet.uuid }
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
