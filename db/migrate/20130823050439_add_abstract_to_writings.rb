class AddAbstractToWritings < ActiveRecord::Migration
  def change
    add_column :writings, :abstract, :text
  end
end
