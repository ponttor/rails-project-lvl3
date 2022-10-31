# frozen_string_literal: true

module Web
  class SessionsController < Web::ApplicationController
    def destroy
      session[:user_id] = nil
      redirect_to root_path, flash: { info: t('messages.buy') }
    end
  end
end
