class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  validates :email, email_format: { message: "doesn't look like an email address" }, presence: true
  validates :name, presence: true

  after_create :send_welcome_email
  after_create :subscribe_to_newsletter, if: :production?

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

  def subscribe_to_newsletter
    SubscribeToNewsletterService.new(self).call
  end

end
