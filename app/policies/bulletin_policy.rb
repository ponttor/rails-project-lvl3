# frozen_string_literal: true

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
    user && record.user_id == user.id
  end

  def update?
    edit?
  end

  def archive?
    edit?
  end

  def moderate?
    edit?
  end
end
