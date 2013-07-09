class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :head
      t.string :text
      t.string :image

      t.timestamps
    end
  end
end
