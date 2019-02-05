# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    after_action :update_discount, only: %i[create update]

    def index
      @items = Item.alphabetical_order
    end

    def new
      @item = Item.new
    end

    def edit
      @item = current_item
    end

    def create
      if @item = Item.create(item_params)
        redirect_to administration_items_path, notice: 'Item has beeen created'
      else
        redirect_to administration_items_path, notice: 'Item has not beeen created'
      end
    end

    def update
      @item = current_item
      if @item.update(item_params)
        redirect_to administration_items_path, notice: 'Item has been modified'
      else
        redirect_to administration_items_path, alert: "Item has not been modified"
      end
    end

    def destroy
      @item = current_item
      @item.destroy
      redirect_to administration_items_path, alert: "Item has been destroyed"
    end

    private

    def item_params
      params.require(:item).permit(:name, :image_url, :description, :price, :discount_percentage, :category_id, :brand_id, :male, :female)
    end

    def current_item
      Item.find(params[:id])
    end

    def update_discount
      if @item.discount_percentage.positive?
        @item.update(has_discount: true)
      else
        @item.update(has_discount: false)
      end
    end
  end
end
