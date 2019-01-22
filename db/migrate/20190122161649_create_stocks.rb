# frozen_string_literal: true

class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.integer :quantity
      t.belongs_to :item, index: true
      t.belongs_to :size, index: true
      t.timestamps
    end
  end
end
