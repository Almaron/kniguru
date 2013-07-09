class CreateBookRates < ActiveRecord::Migration
  def change
    create_table :book_rates do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :rate

      t.timestamps
    end
    
    add_index :book_rates, [:user_id, :book_id], :unique => true
    add_index :book_rates, :book_id
  end
end
