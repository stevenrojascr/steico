class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.string :category
      t.integer :id_for_customer
      t.integer :id_for_us
      t.integer :order_in_list
      t.boolean :active

      t.timestamps
    end
  end
end
