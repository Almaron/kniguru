class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :head
      t.string :page_alias
      t.text :content

      t.timestamps
    end
    add_index :pages, :page_alias, :unique => true
  end
end
