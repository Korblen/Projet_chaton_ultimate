module ApplicationHelper

  # formate le nombre en Euros
  def number_to_euros(number)
    return number_to_currency(number, unit: "€", separator: ",", format: "%n %u")
  end

  def current_cart
    return Cart.find_by(user_id: current_user.id)
  end
end
