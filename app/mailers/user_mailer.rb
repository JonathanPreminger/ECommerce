# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: Rails.application.credentials.MAIL

  def recap_order(email, order)
    @email = email
    @order = order
    mail(to: @email, subject: "Your order #{@order.id}")
  end

  def order_treated(email, order)
    @email = email
    @order = order
    mail(to: @email, subject: "Your order #{@order.id} is on its way!")
  end
end
