class Match < ActiveRecord::Base
  belongs_to :player_1, :class_name => "User", :foreign_key => "player_1_id"
  belongs_to :player_2, :class_name => "User", :foreign_key => "player_2_id"
  
  has_many :plays, :class_name => "Play", :foreign_key => "players_match_id"
end
