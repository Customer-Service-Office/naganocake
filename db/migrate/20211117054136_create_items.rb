class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.integer :category_id, null: false

      t.string :image, null: false
      t.string :name, null: false

      # 商品説明
      t.text :description, null:false

      # 管理者側で登録　税抜価格
      t.integer :price_without_tax, null: false

      # 販売ステータス
      t.boolean :is_active, null: false, default: true

      t.timestamps

    end
  end
end
