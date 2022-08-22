class ApplicationController < ActionController::API
  before_filter :ensure_json_request

  def ensure_json_request
    return if request.headers['Accept'].include?('application/json')

    render nothing: true, status: 406
  end
end
