class User < ApplicationRecord
  TYPES = %w(Manager Seller Buyer).freeze
  ATTRIBUTE_PARAMS = %i(
    name email room area_id password password_confirmation type
  ).freeze

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}, allow_nil: true

  before_save :downcase_email

  devise :database_authenticatable, :registerable, :rememberable, :validatable,
    :confirmable, :recoverable

  def root_path
    routes = Rails.application.routes.url_helpers
    return routes.managers_root_path if is_a?(Manager)
    return routes.sellers_root_path if is_a?(Seller)
    routes.root_path
  end

  private

  def downcase_email
    self.email = email.downcase
  end
end
