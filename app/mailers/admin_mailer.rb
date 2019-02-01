# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.admin_mailer.out_of_stock.subject
  #
  def out_of_stock
    mail(from: "jonathan.mete@hotmail.fr", to: "jonathan.mete@hotmail.fr", subject: "item out of stock",
         delivery_method_options: {
           api_key: Rails.application.credentials.public_mailjet.to_s,
           secret_key: Rails.application.credentials.private_mailjet.to_s
         })
  end

  def recapitulative_command
    mail(from: "jonathan.mete@hotmail.fr", to: "jonathan.mete@hotmail.fr", subject: "Votre commande a bien été enregistrée",
         delivery_method_options: {
           api_key: Rails.application.credentials.public_mailjet.to_s,
           secret_key: Rails.application.credentials.private_mailjet.to_s
         })
  end
end
