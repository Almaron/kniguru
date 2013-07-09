class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :user_id
      t.integer :trackable_id
      t.string :trackable_type
      t.integer :count

      t.timestamps
    end
  end
end
