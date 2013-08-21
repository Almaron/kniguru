class CreateWritings < ActiveRecord::Migration
  def change
    create_table :writings do |t|
      t.string :head
      t.text :content
      t.string :paper_name
      t.string :paper_url
      t.date :published_on

      t.timestamps
    end

    add_index :writings, :published_on
    add_index :presses, :published_on
  end
end
