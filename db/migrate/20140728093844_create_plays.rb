class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.string :player_one_sign
      t.string :player_two_sign
      t.integer :players_match_id

      t.timestamps
    end
  end
end
