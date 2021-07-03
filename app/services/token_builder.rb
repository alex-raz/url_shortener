# frozen_string_literal: true

class TokenBuilder
  def call
    # specifies the length, in bytes, of the random to be generated
    token_length = rand(8..12)

    SecureRandom.urlsafe_base64(token_length)
  end
end
