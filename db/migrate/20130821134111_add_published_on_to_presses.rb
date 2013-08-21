class AddPublishedOnToPresses < ActiveRecord::Migration
  def change
    add_column :presses, :published_on, :date
  end
end
