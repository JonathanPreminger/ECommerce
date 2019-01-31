# frozen_string_literal: true

module CartTotal
  extend ActiveSupport::Concern
  included do
    def total
      cart_items.all.collect(&:subtotal).reduce(:+)
    end
  end
end
