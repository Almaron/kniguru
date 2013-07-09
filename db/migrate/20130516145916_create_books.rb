class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :user_id
      t.integer :season_id
      t.string :title
      t.string :head
      t.text :description
      t.text :full_text
      t.string :cover

      t.timestamps
    end
  end
end
