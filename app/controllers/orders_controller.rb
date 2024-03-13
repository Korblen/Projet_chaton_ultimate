class OrdersController < ApplicationController

  def create
      @order = Order.new(cart_id: params[:cart_id], user_id: current_user.id)

      if @order.save
        #redirect_to checkout_create_path(order_id: @order.id), notice: "Commande validée"
        redirect_to request.referrer, notice: @order.items.length
      else
        redirect_to request.referrer, alert: "Une erreur s'est produite, réessayez !"
      end

  end
end
