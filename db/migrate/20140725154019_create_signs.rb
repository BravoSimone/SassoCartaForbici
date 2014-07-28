class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.string :player_one_sign
      t.string :player_two_sign

      t.timestamps
    end
  end
end
