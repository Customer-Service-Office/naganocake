class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|

      t.integer :order_id, null: false
      t.integer :item_id, null: false

      t.integer :quantity, null: false
      t.integer :price, null: false

      # enum を使用 [0[着手不可、[1]製作待ち、[2]製作中、[3]製作完了
      t.integer :production_status, null: false, default: 0

      t.timestamps
    end
  end
end
