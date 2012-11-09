class Customer < ActiveRecord::Base
  attr_accessible :card_number, :email, :name
end
