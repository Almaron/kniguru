class AddSentToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :sent, :integer, :default => 0
  end
end
