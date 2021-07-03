# frozen_string_literal: true

class LinksCreator
  def initialize(params)
    @long_url = params[:long_url]
  end

  def call
    Link.create(long_url: @long_url, token: build_token)
  end

  private

  def build_token(attempt = 0)
    attempt += 1
    token = TokenBuilder.new.call

    # reduce uniquiness collisions possibility
    max_attempts = 3
    same_token_link = Link.find_by(token: token)
    return build_token(attempt) if same_token_link && attempt < max_attempts

    token
  end
end
