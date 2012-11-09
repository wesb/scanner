class Customer < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  has_many :checkins
end
