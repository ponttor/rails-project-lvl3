# frozen_string_literal: true

class Web::Admin::BulletinsController < Web::Admin::ApplicationController
  def index
    @search_query = Bulletin.ransack(params[:search_query])
    @bulletins = @search_query.result
  end

  def archive
    bulletin = Bulletin.find(params[:id])
    bulletin.archive!

    redirect_to admin_root_path, flash: { info: t('messages.bulletin_archived') }
  end

  def publish
    bulletin = Bulletin.find(params[:id])
    bulletin.publish!

    redirect_to admin_root_path, flash: { info: t('messages.bulletin_published') }
  end

  def reject
    bulletin = Bulletin.find(params[:id])
    bulletin.reject!

    redirect_to admin_root_path, flash: { info: t('messages.bulletin_rejected') }
  end
end
