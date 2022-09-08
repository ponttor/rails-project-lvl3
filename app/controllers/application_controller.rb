# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization
  include AuthConcern

  # helper_method :current_user

  # def current_user
  #   return unless session[:user_id]
  #   @user = User.find(session[:user_id])
  # end

  # def authenticate_user
  #   return true if current_user.present?
  #   redirect_to root_path, flash: { danger: t('messages.no_authentication')}
  #   false
  # end
end
