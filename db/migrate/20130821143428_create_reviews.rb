class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :head
      t.text :content
      t.integer :approved

      t.timestamps
    end
  end
end
