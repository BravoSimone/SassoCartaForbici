class Play < ActiveRecord::Base
  belongs_to :match, :class_name => "Match", :foreign_key => "match_id"
end
