# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.all
    @categories = Category.all
    @brands = Brand.all
  end

  def show
    @item = Item.find
  end
end
