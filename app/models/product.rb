class Product < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  mount_uploader :photo, PhotoUploader

end
