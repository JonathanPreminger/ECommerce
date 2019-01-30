# frozen_string_literal: true

module CartTotal
  extend ActiveSupport::Concern
  included do
    def subtotal
      quantity * item.price
    end
  end
end