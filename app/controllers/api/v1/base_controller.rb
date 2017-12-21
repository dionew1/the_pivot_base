class Api::V1::BaseController < ApplicationController
  include Response
  include ExceptionHandler

  before_action :authenticate!

  def route_not_found
    render json: { error: "not found" }, status: 404
  end

  def authenticate!
    json_response({ error: 'Invalid Credentials' }, 401) unless authorized?
  end

  def authorized?
    return true if ApiKey.exists?(key: params[:api_key] )
    false
    # if current_user && current_user.developer?
      # params[:api_key] && params[:api_key] == current_user.api_key[:key]
    # end
  end
end