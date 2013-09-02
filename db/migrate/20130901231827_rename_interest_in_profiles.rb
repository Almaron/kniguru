class RenameInterestInProfiles < ActiveRecord::Migration
  def change
    rename_column :profiles, :interest, :favourite_books
  end
end
