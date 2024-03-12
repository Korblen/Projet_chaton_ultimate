class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # table 1-N
  has_many :carts


  # callbacks
  after_create :create_cart
  
  def create_cart
    Cart.create!(
    user_id: self.id
    )
  end

end
