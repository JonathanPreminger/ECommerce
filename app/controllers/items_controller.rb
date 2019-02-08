# frozen_string_literal: true

class ItemsController < ApplicationController
  def index
    @items = Item.alphabetical_order
    @categories = Category.all
    @brands = Brand.all
  end

  def show
    @item = Item.find(params[:id])
    @sizes = Size.all
  end

  def filter
    @categories = Category.all
    @brands = Brand.all
    if params[:option].split(" ")[0] == "brand"
      @items = Item.by_brand(params[:option].split(" ")[1].to_i)
    elsif params[:option].split(" ")[0] == "category"
      @items = Item.by_category(params[:option].split(" ")[1].to_i)
      puts "--------SIMON--------"
      p @items
    end
  end
end
