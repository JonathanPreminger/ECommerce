 # frozen_string_literal: true

class AdministrationController < ApplicationController
  before_action :load_navbar_data
  before_action :authenticate_admin!
  layout "administration"

  def load_navbar_data
    @last_three = Order.last_3_orders
    @orders_to_be_treated = Order.to_be_treated
  end
end
