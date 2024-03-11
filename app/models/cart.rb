class Cart < ApplicationRecord
   # table N-1
   belongs_to :user

   # table N-N through
   has_many :cart_items
   has_many :items, through: :cart_items
end
