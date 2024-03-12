class CartItemsController < ApplicationController
  before_action :set_cart_item, only: %i[ destroy ]
  
  def create
  end

  def destroy
    cart_id = @cart_item.cart_id
    if @cart_item.destroy!
      redirect_to cart_path(cart_id), notice: "L'article a été supprimé."
    else
      render cart_path(cart_id), alert: "Une erreur est survenue: l'article n'a pas été supprimé."
    end
  end

  private
  def set_cart_item
    @cart_item = CartItem.find_by(cart_id: params[:id], item_id: params[:item_id])
  end

end
