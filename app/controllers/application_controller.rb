class ApplicationController < ActionController::Base
  before_action :set_locale
  add_flash_types :danger, :info, :warning, :success

  private
  def set_locale
    I18n.locale = extract_locale || I18n.default_locale
  end
  def extract_locale
    parsed_locale = params[:locale]
    I18n.available_locales.map(&:to_s).include?(parsed_locale) ? parsed_locale : nil
  end
end
