# frozen_string_literal: true

class TreatedOrderMailer < ApplicationMailer
  default from: Rails.application.credentials.MAIL

  def order_treated(email, order)
    @email = email
    @order = order
    mail(to: @email, subject: "Your order #{@order.id} is on its way!")
  end
end
