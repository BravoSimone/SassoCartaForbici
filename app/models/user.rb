class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :matches_as_player_one, :class_name => "Match", :foreign_key => "player_1_id"
  has_many :matches_as_player_two, :class_name => "Match", :foreign_key => "player_2_id"
  
  def self.all_matches(id)
    Match.where("player_1_id = ? OR player_2_id = ?", id, id)
  end
end