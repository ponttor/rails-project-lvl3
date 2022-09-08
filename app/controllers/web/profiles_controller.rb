class Web::ProfilesController < Web::ApplicationController
  def show

    if current_user.present?
      @search_query = current_user.bulletins.ransack(params[:search_query])
      @bulletins = @search_query.result
    else
      redirect_to root_path, flash: { danger: t('messages.no_authentication')}
    end

  end
end
