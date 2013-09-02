class RenameBirtdayToBirthdayInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :birtday, :birthday
  end
end
