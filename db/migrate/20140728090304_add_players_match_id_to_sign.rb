class AddPlayersMatchIdToSign < ActiveRecord::Migration
  def change
    add_column :signs, :players_match_id, :integer
  end
end
