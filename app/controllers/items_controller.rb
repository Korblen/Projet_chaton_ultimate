class ItemsController < ApplicationController
    def index
        @items = Item.all
    end

    def show
        @item = Item.find(params[:id]) # Assurez-vous que cela récupère l'objet @item correctement
    end

    def create
    end

    def update
    end
end
