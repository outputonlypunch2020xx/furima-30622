class ApplicationController < ActionController::Base
  # before_action :basic_auth

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'outputonlypunch2020' && password == '30622'
    end
  end
end
