class Order < ApplicationRecord
  # table N-1
  belongs_to :user

  # table N-N through
  has_many :order_items
  has_many :items, through: :order_items
end
