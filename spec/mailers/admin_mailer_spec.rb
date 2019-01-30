# frozen_string_literal: true

require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
  describe "out_of_stock" do
    let(:mail) { AdminMailer.out_of_stock }

    it "renders the headers" do
      expect(mail.subject).to eq("Out of stock")
    end

    it "renders the destination" do
      expect(mail.to).to eq(["to@example.org"])
    end

    it "renders the origin" do
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end
end
