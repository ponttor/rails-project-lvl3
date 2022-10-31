# frozen_string_literal: true

module AuthConcern
  extend ActiveSupport::Concern

  def current_user
    return unless session[:user_id]

    @user = User.find(session[:user_id])
  end

  def authenticate_user
    return if current_user

    redirect_to root_path
  end

  def admin?
    current_user&.admin
  end

  def signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_admin
    return if admin?

    redirect_to root_path
  end
end
