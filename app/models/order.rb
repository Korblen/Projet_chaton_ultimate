class Order < ApplicationRecord
  # table N-1
  belongs_to :user

  # table N-N through
  has_many :order_items
  has_many :items, through: :order_items


  after_create :send_alert_to_admin
  after_create :send_alert_to_user


  def amount
    amount = 0;
    self.items.each{ |item| amount += item.price }
    return amount
  end

  def add_items(item_ids)
    item_ids.each do |item_id| 
      OrderItem.create!(order_id: self.id, item_id: item_id)
    end
  end

  # private

  def send_alert_to_admin
    UserMailer.order_alert_admin(admin).deliver_now
  end

  def send_alert_to_user
    UserMailer.order_alert_user(self.user).deliver_now
  end
end
