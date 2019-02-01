# frozen_string_literal: true

require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
  describe "out_of_stock" do
    let(:mail) { AdminMailer.out_of_stock }

    it "renders the headers" do
      expect(mail.subject).to eq("item out of stock")
    end

    it "renders the destination" do
      expect(mail.to).to eq(["jonathan.mete@hotmail.fr"])
    end

    it "renders the origin" do
      expect(mail.from).to eq(["jonathan.mete@hotmail.fr"])
    end
  end

  describe "recapitulative_command" do
    let(:mail) { AdminMailer.recapitulative_command }

    it "renders the headers" do
      expect(mail.subject).to eq("Votre commande a bien été enregistrée")
    end

    it "renders the destination" do
      expect(mail.to).to eq(["jonathan.mete@hotmail.fr"])
    end

    it "renders the origin" do
      expect(mail.from).to eq(["jonathan.mete@hotmail.fr"])
    end
  end
end
