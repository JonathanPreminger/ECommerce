# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.decimal :total, default: 0
      t.belongs_to :user
      t.timestamps
    end
  end
end
