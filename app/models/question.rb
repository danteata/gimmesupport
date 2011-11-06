class Question < ActiveRecord::Base
  belongs_to :member
  belongs_to :community

  has_many :responses,:as => :respondable, :dependent => :destroy #questions can be responded to and deleted question go with their responses 

  validates :content, :presence =>true #blank questions are not acceptable 

  before_save :set_initial_status #sets the status of the question
  before_save :associate_member_with_community #associates the topic poster as a contributor to the community

  default_scope :order =>"questions.created_at DESC" #display most current posts first 
  private

  #setting the initial status of a question
  def set_initial_status
    if self.status.blank?
      self.status = "unsolved"
    end
  end

  #associates the question as being asked from a specific company or community
  def associate_member_with_community
  self.community.members << self.member unless self.community.members.include? self.member
  end
  
end
