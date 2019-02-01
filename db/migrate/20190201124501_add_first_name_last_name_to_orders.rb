# frozen_string_literal: true

class AddFirstNameLastNameToOrders < ActiveRecord::Migration[5.2]
  def change
    change_table :orders, bulk: true do |t|
      t.text :first_name
      t.text :last_name
    end
  end
end
