class AddBooktmateIdToBooks < ActiveRecord::Migration
  def change
    add_column :books, :bookmate_id, :integer
  end
end
