# frozen_string_literal: true

class Link < ApplicationRecord

  has_many :visits, dependent: :destroy
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
