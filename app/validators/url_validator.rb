# frozen_string_literal: true

class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.present? && compliant?(value)

    record.errors.add(attribute, 'is not a valid URL')
  end

  private

  def compliant?(value)
    uri = URI.parse(value)

    uri.is_a?(URI::HTTP) && !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end
end
