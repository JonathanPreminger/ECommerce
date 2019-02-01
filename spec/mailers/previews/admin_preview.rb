# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/admin
class AdminPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/admin/out_of_stock
  def out_of_stock
    AdminMailer.out_of_stock
  end
end
