class Api::V1::CheckinController < ApiV1Controller

  respond_to :json

  def create
    @checkin = Checkin.new(safe_params)
    if @checkin.save
      Urbanairship.push({
        device_tokens: [@checkin.customer.device_token],
        aps: {
          :alert => 'Welcome to Costco. Open for the latest deals.',
          :url => products_customer_url(@checkin.customer)
        }
      })
      #respond_with @checkin
    else
      render(:json => {:error => @checkin.errors.messages}, :status => 406)
    end
  end

  private

  def safe_params
    safe_attributes = [
      :card_number,
      :store_id,
    ]
    params.require(:checkin).permit(*safe_attributes)
  end

end
