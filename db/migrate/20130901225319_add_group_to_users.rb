class AddGroupToUsers < ActiveRecord::Migration
  def change
    add_column :users, :group, :string, :default => "user"
  end
end
