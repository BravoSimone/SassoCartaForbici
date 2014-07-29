class Match < ActiveRecord::Base
  belongs_to :player_1, :class_name => "User", :foreign_key => "player_1_id"
  belongs_to :player_2, :class_name => "User", :foreign_key => "player_2_id"
  
  has_many :plays, :class_name => "Play", :foreign_key => "players_match_id"
  
  def self.find_match_by_id(p1, p2)
    Match.where("(player_1_id = ? AND player_2_id = ?) OR (player_1_id = ? AND player_2_id = ?)", p1, p2,p2 ,p1 ).new
  end
end
