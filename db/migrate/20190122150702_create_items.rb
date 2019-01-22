# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.decimal :price, null: false, precision: 2
      t.boolean :has_discount, default: false
      t.boolean :male
      t.boolean :female
      t.integer :discount_percentage, default: 0
      t.belongs_to :category, index: true
      t.belongs_to :brand, index: true
      t.timestamps
    end
  end
end
