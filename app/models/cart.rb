class Cart < ApplicationRecord
   # table N-1
   belongs_to :user

   # table N-N through
   has_many :cart_items
   has_many :items, through: :cart_items

   def total
      total = 0;
      self.items.each{ |item| total += item.price }
      return total
   end
end
