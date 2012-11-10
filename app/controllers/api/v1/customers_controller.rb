class Api::V1::CustomersController < ApiV1Controller

  respond_to :json

  def create
    @customer = Customer.find_by_card_number(safe_params[:card_number])
    if @customer
      @customer.assign_attributes(safe_params)
    else
      @customer = Customer.new(safe_params)
    end
    if @customer.save
      #respond_with @customer
    else
      render(:json => {:error => @customer.errors.messages}, :status => 406)
    end
  end

  private

  def safe_params
    safe_attributes = [
      :name,
      :card_number,
      :device_token,
    ]
    params.require(:customer).permit(*safe_attributes)
  end

end
