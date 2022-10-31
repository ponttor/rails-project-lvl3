# frozen_string_literal: true

module Web
  class BulletinsController < Web::ApplicationController
    def index
      @search_query = Bulletin.published.ransack(params[:search_query])
      @bulletins = @search_query.result
      authorize @bulletins
    end

    def show
      @bulletin = Bulletin.find(params[:id])
      authorize @bulletin
    end

    def new
      authorize Bulletin
      @bulletin = current_user.bulletins.build
    end

    def create
      authorize Bulletin
      @bulletin = current_user.bulletins.build(bulletin_params)
      if @bulletin.save
        redirect_to profile_path, flash: { info: t('messages.bulletin_created') }
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
      @bulletin = Bulletin.find(params[:id])
      authorize @bulletin
    end

    def update
      @bulletin = Bulletin.find(params[:id])
      authorize @bulletin
      if @bulletin.update(bulletin_params)
        redirect_to profile_path, flash: { info: t('messages.bulletin_updated') }
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def archive
      @bulletin = Bulletin.find params[:id]
      authorize @bulletin
      @bulletin.archive!

      redirect_to profile_path, flash: { info: t('messages.bulletin_archived') }
    end

    def moderate
      @bulletin = Bulletin.find params[:id]
      authorize @bulletin
      @bulletin.moderate!

      redirect_to profile_path, flash: { info: t('messages.bulletin_moderated') }
    end

    private

    def bulletin_params
      params.require(:bulletin).permit(:title, :description, :bulletin_id, :category_id, :image)
    end
  end
end
