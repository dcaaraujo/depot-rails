class ApplicationController < ActionController::Base
  before_action :authorize

  protected

    def authorize
      unless User.exists?(session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end
end
