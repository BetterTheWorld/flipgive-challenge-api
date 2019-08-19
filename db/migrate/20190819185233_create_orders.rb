class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :ref, null: false
      t.string :order_type, null: false
      t.decimal :amount, null: false
      t.timestamp :ordered_at, null: false
      t.string :email, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
