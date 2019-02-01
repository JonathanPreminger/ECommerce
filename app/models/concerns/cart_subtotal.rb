# frozen_string_literal: true

module CartSubtotal
  extend ActiveSupport::Concern
  included do
    def subtotal
      quantity * item.final_price
    end
  end
end
