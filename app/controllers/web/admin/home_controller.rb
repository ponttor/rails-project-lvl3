# frozen_string_literal: true

module Web
  module Admin
    class HomeController < Web::Admin::ApplicationController
      def admin
        @bulletins = Bulletin.where(state: 'under_moderation').order(created_at: :desc).page params[:page]
      end
    end
  end
end
