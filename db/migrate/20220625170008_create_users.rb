# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.boolean :admin
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
