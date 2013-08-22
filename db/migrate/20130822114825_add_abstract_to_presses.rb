class AddAbstractToPresses < ActiveRecord::Migration
  def change
    add_column :presses, :abstract, :text
  end
end
