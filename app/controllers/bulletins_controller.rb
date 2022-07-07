# frozen_string_literal: true

class BulletinsController < ApplicationController
  def index
    @bulletins = Bulletin.order(created_at: :desc)
  end

  def show
    @bulletin = Bulletin.find(params[:id])
  end

  def new
    @user = User.find(session[:user_id])
    @bulletin = @user.bulletins.build
  end

  def create
    @user = User.find(session[:user_id])
    @bulletin = @user.bulletins.build(bulletin_params)
    if @bulletin.save
      redirect_to @bulletin
    else
      render :new, status: unprocessable_entity
    end
  end

  private

  def bulletin_params
    params.require(:bulletin).permit(:title, :description, :bulletin_id, :user_id, :category_id, :image)
  end
end
