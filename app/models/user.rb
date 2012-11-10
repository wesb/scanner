class User < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  has_secure_password

  validates :name, presence: true
  validates :email,
    presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: Rails.application.config.email_regex }
  validates :password, presence: true, on: :create
  validates :password, length: { minimum: 4 }, allow_blank: true
end
