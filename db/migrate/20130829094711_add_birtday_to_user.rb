class AddBirtdayToUser < ActiveRecord::Migration
  def change
    add_column :users, :birtday, :date
  end
end
