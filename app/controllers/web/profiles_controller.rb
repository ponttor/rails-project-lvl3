# frozen_string_literal: true

module Web
  class ProfilesController < Web::ApplicationController
    before_action :authenticate_user

    def show
      # if current_user.present?
      # authorize Profile
      @search_query = current_user.bulletins.ransack(params[:search_query])
      @bulletins = @search_query.result.page params[:page]
      # authorize @bulletin
      # else
      #   redirect_to root_path
      # end
    end
  end
end
