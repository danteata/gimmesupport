class Question < ActiveRecord::Base
  belongs_to :member
  belongs_to :community

  has_many :responses, :dependent => :destroy

  validates :content, :presence =>true

  before_save :set_initial_status #sets the status of the question
  before_save :associate_member_with_community #associates the topic poster as a contributor to the community

  default_scope :order =>"questions.created_at DESC" #display most current posts first 
  private

  def set_initial_status
    if self.status.blank?
      self.status = "unsolved"
    end
  end

  def associate_member_with_community
  self.community.members << self.member unless self.community.members.include? self.member
  end
  
end
