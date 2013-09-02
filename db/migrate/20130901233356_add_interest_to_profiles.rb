class AddInterestToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :interest, :string
  end
end
