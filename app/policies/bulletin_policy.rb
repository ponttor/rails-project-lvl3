class BulletinPolicy < ApplicationPolicy

  def index?
    true
  end

  def show?
    record.user_id == user&.id || record.state == 'published' || user&.admin
  end

  def new?
    user
  end

  def create?
    user
  end

  def edit?
    record.user_id == current_user.id
  end

  def update?
    record.user_id == current_user.id
  end

  def archive
    record.user_id == current_user.id
  end

  def moderate
    record.user_id == current_user.id
  end
end