class Checkin < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  
  belongs_to :customer
  validates :customer_id, presence: true

  def card_number=(num)
    self.customer = Customer.find_by_card_number(num)
  end

end
