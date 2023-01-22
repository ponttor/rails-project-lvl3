# frozen_string_literal: true

class CreateBulletins < ActiveRecord::Migration[6.1]
  def change
    create_table :bulletins do |t|
      t.text :description
      t.string :state
      t.string :title
      t.references :user, null: false, foreign_key: true, intex: true
      t.references :category, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
