class AddShortListToBooks < ActiveRecord::Migration
  def change
    add_column :books, :short_list, :integer, :default => 0
    add_index :books, :short_list
  end
end
