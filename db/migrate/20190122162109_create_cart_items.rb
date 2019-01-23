# frozen_string_literal: true

class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :quantity, default: 1
      t.belongs_to :cart, index: true
      t.belongs_to :item, index: true
      t.belongs_to :size, index: true
      t.belongs_to :order, optional: true, index: true
      t.timestamps
    end
  end
end
