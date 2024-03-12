class Order < ApplicationRecord
  # table N-1
  belongs_to :user

  # table N-N through
  has_many :order_items
  has_many :items, through: :order_items


  after_create :send_alert_to_admin
  after_create :send_alert_to_user

  private

  def send_alert_to_admin
    if order.present? 
      UserMailer.order_alert_admin(admin).deliver_now
    end
  end

  def send_alert_to_user
    if order.present?
      UserMailer.order_alert_user(user).deliver_now
    end
  end
end
