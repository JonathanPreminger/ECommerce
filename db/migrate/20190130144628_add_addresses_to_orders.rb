# frozen_string_literal: true

class AddAddressesToOrders < ActiveRecord::Migration[5.2]
  def change
    change_table :orders, bulk: true do |t|
      t.integer :orders, :billing_id
      t.integer :orders, :delivery_id
    end
  end
end
