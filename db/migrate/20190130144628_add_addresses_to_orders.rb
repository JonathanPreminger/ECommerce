# frozen_string_literal: true

class AddAddressesToOrders < ActiveRecord::Migration[5.2]
  def change
    change_table :orders, bulk: true do |t|
      t.text :billing_address
      t.text :delivery_address
    end
  end
end
