class ApplicationController < ActionController::API
  before_action :ensure_json_request # before_filter to old version of Rails

  def ensure_json_request
    return if request.headers['Accept'].include?('application/json')

    render nothing: true, status: 406
  end
end
