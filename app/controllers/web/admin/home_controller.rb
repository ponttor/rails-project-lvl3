class Web::Admin::HomeController < Web::Admin::ApplicationController
  def admin
    @bulletins = Bulletin.order(created_at: :desc).filter(&:under_moderation?)
  end
end
