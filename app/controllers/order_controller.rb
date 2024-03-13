class OrderController < ApplicationController
  def index
  end

  def show
    
  end

  def create
      @order = Order.new(cart_id: params[:cart_id], user_id: params[:user_id])

      if @order.save
        redirect_to checkout_create_path(order_id: order_id), notice: "Commande validée"
      else
        redirect_to request.referrer, alert: "Une erreur s'est produite, réessayez !"
      end
  end
end
