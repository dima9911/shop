class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|

    	t.string :user_id
    	t.string :product_id
    	t.integer :count
    	t.float :price
    	t.string :state


      t.timestamps null: false
    end
  end
end
