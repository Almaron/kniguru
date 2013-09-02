class AddFieldsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :hide_fields, :string
    add_column :profiles, :first_name, :string
    add_column :profiles, :last_name, :string
    add_column :profiles, :country, :string
    add_column :profiles, :state, :string
    add_column :profiles, :city, :string
    add_column :profiles, :adress, :string
    add_column :profiles, :phone, :string
    add_column :profiles, :school, :string
    add_column :profiles, :school_class, :string
    add_column :profiles, :favourite_class, :string
    add_column :profiles, :library, :string
    add_column :profiles, :how_do_you_know, :string
    add_column :profiles, :jury, :boolean, :default => false
    add_column :profiles, :why_jury, :text
    add_column :profiles, :education, :string
    add_column :profiles, :interest, :string
    add_column :profiles, :profession, :string

    add_index :profiles, :jury
  end
end
