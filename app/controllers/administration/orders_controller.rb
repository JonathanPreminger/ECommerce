# frozen_string_literal: true

module Administration
  class OrdersController < AdministrationController
    def index
      @orders_treated = Order.all.treated
      @orders_to_be_treated = Order.to_be_treated
    end

    def show
      @order = current_order
    end

    def update
      @order = current_order
      if @order.update(status: true)
        TreatedOrderMailer.order_treated(@order.user.email, @order).deliver_later
        redirect_to administration_orders_path, notice: 'Order updated to sent'
      else
        redirect_to administration_items_path, alert: "Order not updated to send"
      end
    end

    private

    def order_params
      params.require(:order).permit(:id)
    end

    def current_order
      Order.find(params[:id])
    end
  end
end
