# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :check_user, only: :show

  def show
    @cart = @current_cart
  end

  def destroy
    @cart = @current_cart
    @cart.destroy
    respond_to do |format|
      format.js { flash[:notice] = "Votre panier a bien été vidé" }
    end
  end

  protected

  def check_user
    redirect_to root_path unless user_signed_in?
  end
end
