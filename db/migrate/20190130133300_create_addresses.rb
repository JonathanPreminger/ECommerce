# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :number
      t.string :road
      t.integer :zip_code
      t.string :town
      t.string :state
      t.string :country
      t.references :profile, foreign_key: true
      t.boolean :billing, default: false

      t.timestamps
    end
  end
end
