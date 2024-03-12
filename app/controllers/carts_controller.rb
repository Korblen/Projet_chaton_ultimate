class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show ]
  before_action :authenticate_user!

  # GET /carts/1
  def show
    # redirection si user n'est pas le propriétaire du panier
    redirect_to root_path if current_user != @cart.user
  end

  # PATCH/PUT /carts/1
  def update
    if @cart.update(cart_params)
      redirect_to cart_url(@cart), notice: "Votre panier a été mis à jour." 
    else
      render :show, alert: "Une erreur est survenue..."
    end
  end

  private
  def set_cart
    @cart = Cart.find(params[:id])
  end

  def cart_params
    params.require(:cart).permit(:validated)
  end

end
