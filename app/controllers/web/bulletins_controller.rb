# frozen_string_literal: true

class Web::BulletinsController < Web::ApplicationController
  def index
    @search_query = Bulletin.published.ransack(params[:search_query])
    @bulletins = @search_query.result
    authorize @bulletins
  end

  def show
    @bulletin = Bulletin.find(params[:id])
    authorize @bulletin
  end

  # def new
  #   if current_user.present?
  #     @bulletin = current_user.bulletins.build
  #   else
  #     redirect_to root_path, flash: { danger: t('messages.no_authentication')}
  #   end
  # end

  def new
    @bulletin = current_user.bulletins.build
    authorize @bulletin
  end

  # def create
  #   if current_user.present?
  #     @bulletin = current_user.bulletins.build(bulletin_params)
  #     if @bulletin.save
  #       redirect_to profile_path, flash: { info: t('messages.bulletin_created') }
  #     else
  #       render :new, status: :unprocessable_entity
  #     end
  #   else
  #     redirect_to root_path, flash: { danger: t('messages.no_authentication')}
  #   end
  # end

  def create
      @bulletin = current_user.bulletins.build(bulletin_params)
      authorize @bulletin
      if @bulletin.save
        redirect_to profile_path, flash: { info: t('messages.bulletin_created') }
      else
        render :new, status: :unprocessable_entity
      end
    # else
    #   redirect_to root_path, flash: { danger: t('messages.no_authentication')}
    # end
  end

  def edit
    if current_user.present?
      @bulletin = Bulletin.find(params[:id])
      authorize @bulletin
    else
      redirect_to root_path, flash: { danger: t('messages.no_authentication')}
    end
  end

  def update
    if current_user.present?
      @bulletin = Bulletin.find(params[:id])
      authorize @bulletin
      if @bulletin.update(bulletin_params)
        redirect_to profile_path, flash: { info: t('messages.bulletin_updated') }
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to root_path, flash: { danger: t('messages.no_authentication')}
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
