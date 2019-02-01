# frozen_string_literal: true

module CartTotal
  extend ActiveSupport::Concern
  included do
    def tot
      cart_items.all.collect(&:subtotal).reduce(:+)
    end
  end
end
