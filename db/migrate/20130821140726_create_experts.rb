class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :name
      t.text :content
    end
  end
end
