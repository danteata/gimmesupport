class Chat < ActiveRecord::Base
  belongs_to :member
  belongs_to :rep, :class_name=>"Member", :foreign_key=>"rep_id"

  validates :member_id, :presence => true
  validates :rep_id, :presence => true
  validate :community_id, :presence => true
end
