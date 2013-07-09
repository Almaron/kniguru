class CreateBookTracks < ActiveRecord::Migration
  def change
    create_table :book_tracks do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :status

      t.timestamps
    end
  end
end
