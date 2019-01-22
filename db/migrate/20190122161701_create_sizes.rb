# frozen_string_literal: true

class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string :value
      t.timestamps
    end
  end
end
