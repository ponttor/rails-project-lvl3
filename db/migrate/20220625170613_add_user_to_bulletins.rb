# frozen_string_literal: true

class AddUserToBulletins < ActiveRecord::Migration[6.1]
  def change
    add_reference :bulletins, :user, null: false, foreign_key: true, intex: true
  end
end
