class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user, index: true
      t.integer :hour
      t.integer :day

      t.timestamps
    end
  end
end
