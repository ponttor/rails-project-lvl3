# frozen_string_literal: true

module Admin
  class HomePolicy < ApplicationPolicy
    def index?
      user.admin?
    end

    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end
end
