class User < ApplicationRecord
	 before_create :generate_api_token

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }

  private

  def generate_api_token
    self.api_token = SecureRandom.hex(20) # Generates a 40-character random token
  end
end
