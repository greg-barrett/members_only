class User < ApplicationRecord
  has_many :posts
  attr_accessor :token_digest
  before_create :set_token
  validates :name, presence: true
  validates :email, presence: true
  has_secure_password
  # secretely made virtual password and password_confirmation
  def refresh_token
    token=SecureRandom.urlsafe_base64
    token_digest=Digest::SHA1.hexdigest(token.to_s)
  end


private
  def set_token
    token=SecureRandom.urlsafe_base64
    token_digest=Digest::SHA1.hexdigest(token.to_s)
    self.remember_token= token_digest
  end

end
