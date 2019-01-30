# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include CurrentCart
  include CartTotal
end
