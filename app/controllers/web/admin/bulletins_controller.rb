# frozen_string_literal: true

module Web
  module Admin
    class BulletinsController < Web::Admin::ApplicationController
      def index
        @search_query = Bulletin.ransack(params[:search_query])
        @bulletins = @search_query.result.page params[:page]
      end

      def reject
        @bulletin = current_bulletin
        @bulletin.reject!

        redirect_to admin_bulletins_path, flash: { info: t('messages.bulletin_rejected') }
      end

      def archive
        @bulletin = current_bulletin
        @bulletin.archive!

        redirect_to admin_bulletins_path, flash: { info: t('messages.bulletin_archived') }
      end

      def publish
        @bulletin = current_bulletin
        @bulletin.publish!

        redirect_to admin_root_path, flash: { info: t('messages.bulletin_published') }
      end

      private
  
      def current_bulletin
        Bulletin.find params[:id]
      end
    end
  end
end
