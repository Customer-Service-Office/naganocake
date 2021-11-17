class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :customer_id, null: false

      t.string :postcode, null: false
      t.string :address, null: false
      t.string :full_name, null: false
      t.integer :postage, null: false
      t.integer :total_payment, null: false

      # enum を使用　[0]クレジットカード、[1]銀行振り込み
      t.integer :payment_method, null: false, default: 0

      # enum を使用  [0]入金待ち、[1]入金確認、[2]制作中、[3]発送準備中、[4]発送済み
      t.integer :order_status, null: false, default: 0


      t.timestamps
    end
  end
end
