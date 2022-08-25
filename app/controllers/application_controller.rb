class ApplicationController < ActionController::API
  before_action :ensure_json_request

  def ensure_json_request
    if request.headers['Accept'] =~ /vnd\.api\+json/
      unless request.get?
        return if request.headers['Content-Type'] =~ /vnd\.api\+json/

        render nothing: true, status: 415
      end
    else
      render nothing: true, status: 406
    end
  end

  # def ensure_json_request
  #   if request.headers['Accept'].include?('application/json')
  #     unless request.headers['Content-Type'].include?('application/json')
  #       render json: { error: 'Invalid Content-Type header' }, status: :unsupported_media_type
  #     end
  #   else
  #     render json: { error: 'Invalid Accept header' }, status: :not_acceptable
  #   end
  # end
end
