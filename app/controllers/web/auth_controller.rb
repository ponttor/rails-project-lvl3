# frozen_string_literal: true

class Web::AuthController < Web::ApplicationController
  def callback
    @user = User.find_or_create_from_auth(request.env['omniauth.auth'])
    session[:user_id] = @user.id if @user
    redirect_to root_path
  end
end
