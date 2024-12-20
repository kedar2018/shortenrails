class Url < ApplicationRecord
	validates :original_url, presence: true, format: URI::regexp(%w[http https])
  validates :short_url, uniqueness: true

  before_create :generate_short_url

  private

  def generate_short_url
    self.short_url = loop do
      token = SecureRandom.urlsafe_base64(5)
      break token unless Url.exists?(short_url: token)
    end
  end
end
