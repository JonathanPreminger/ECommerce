# frozen_string_literal: true

module ClearFlash
  extend ActiveSupport::Concern
  included do
    after_action :clear_xhr_flash
  end

  protected

  def clear_xhr_flash
    flash.discard if request.xhr?
  end
end
