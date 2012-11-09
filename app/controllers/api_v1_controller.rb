class ApiV1Controller < ApplicationController
  skip_before_filter :verify_authenticity_token
  before_filter :verify_api_token

  private

  def verify_api_token
    if params[:api_token] != "test"
      render(:json => {:error => "Invalid API token"}, :status => 401)
    end
  end

end

