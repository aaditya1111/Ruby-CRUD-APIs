class ApplicationController < ActionController::Base

  #before_action :authenticate
  attr_reader :current_token, :current_user
  private

  def current_token
    @token || nil
  end

  def current_user
    @current_user = User.find($redis.hget(current_token, :user_id)) if current_token
  end

  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @token = nil
      if AuthToken.valid?(token) && $redis.ttl(token) > 0
        @token = token
        $redis.expire(token, 20.minutes.to_i) # set TTL as constant
      end
      @token
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render nothing: true, status: :unauthorized, content_type: 'application/json'
  end
end
