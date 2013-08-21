class CreatePresses < ActiveRecord::Migration
  def change
    create_table :presses do |t|
      t.string :head
      t.text :content
      t.string :paper_name
      t.string :paper_url

      t.timestamps
    end
  end
end
