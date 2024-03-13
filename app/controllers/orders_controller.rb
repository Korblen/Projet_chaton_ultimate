class OrdersController < ApplicationController

  def create
      @order = Order.new(user_id: current_user.id)

      if @order.save
        @cart = Cart.find(params[:cart_id])
        @order.add_items(@cart.item_ids)
        @cart.drop
        redirect_to checkout_create_path(order_id: @order.id), notice: "Commande validée"
        #redirect_to request.referrer, notice: @order.items.length
      else
        redirect_to request.referrer, alert: "Une erreur s'est produite, réessayez !"
      end

  end
end
