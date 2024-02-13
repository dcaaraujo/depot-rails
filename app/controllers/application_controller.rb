class ApplicationController < ActionController::Base
  before_action :set_i18n_locale_from_params
  before_action :authorize

  protected

    def authorize
      unless User.exists?(session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end

    def set_i18n_locale_from_params
      new_locale = params[:locale]
      return if new_locale.nil?
      if I18n.available_locales.map(&:to_s).include?(new_locale)
        I18n.locale = new_locale
      else
        flash.now[:notice] = "#{new_locale} translation not available"
        logger.error flash.now[:notice]
      end        
    end
end
