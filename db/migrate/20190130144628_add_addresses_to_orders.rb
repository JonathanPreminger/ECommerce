# frozen_string_literal: true

class AddAddressesToOrders < ActiveRecord::Migration[5.2]
  def change
    change_table :orders, bulk: true do |t|
      t.integer :billing_id
      t.integer :delivery_id
    end
  end
end
