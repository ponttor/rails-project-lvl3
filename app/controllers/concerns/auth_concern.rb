# frozen_string_literal: true

module AuthConcern
  extend ActiveSupport::Concern

  def admin?
    current_user&.admin
  end

  def signed_in?
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def authenticate_user
    return if current_user

    redirect_to root_path, flash: { danger: t('only_for_users') }
    
  end

  def authenticate_admin
    return if admin?

    redirect_to root_path, flash: { danger: t('only_for_admins') }
  end
end
