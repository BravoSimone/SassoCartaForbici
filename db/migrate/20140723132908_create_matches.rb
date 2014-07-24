class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :player_1_id
      t.integer :player_2_id
      t.integer :p1_win
      t.integer :p2_win
      t.integer :request_close
      t.integer :accept_close

      t.timestamps
    end
  end
end
