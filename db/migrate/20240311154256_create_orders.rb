class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.belongs_to :cart_id
      
      t.timestamps
    end
  end
end
