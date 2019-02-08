# frozen_string_literal: true

module ItemCount
  extend ActiveSupport::Concern
  included do
    def all_items
      cart_items.collect(&:quantity).reduce(:+)
    end
  end
end
