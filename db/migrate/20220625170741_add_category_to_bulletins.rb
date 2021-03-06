# frozen_string_literal: true

class AddCategoryToBulletins < ActiveRecord::Migration[6.1]
  def change
    add_reference :bulletins, :category, null: false, foreign_key: true, index: true
  end
end
