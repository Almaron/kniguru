class AddTypeToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :type, :string
    
    add_index :badges, :type
  end
end
