# frozen_string_literal: true

module Administration
  class ItemsController < AdministrationController
    def index
      @items = Item.all
    end

    def new
      @item = Item.new
    end

    def edit
      @item = current_item
    end

    def update
      @item = current_item
      if @item.update(item_params)
        redirect_to administration_items_path, notice: 'Le prix a bien été modifié'
      else
        redirect_to administration_items_path, alert: "Le prix n'a pas été modifié"
      end
    end

    private

    def item_params
      params.require(:item).permit(:discount_percentage)
    end

    def current_item
      Item.find(params[:id])
    end
  end
end
