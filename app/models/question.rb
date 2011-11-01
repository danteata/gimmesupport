class Question < ActiveRecord::Base
  belongs_to :member
  belongs_to :community

  has_many :responses, :dependent => :destroy

  validates :content, :presence =>true

  before_save :set_initial_status #sets the status of the question

  private

  def set_initial_status
    if self.status.blank?
      self.status = "unsolved"
    end
  end
  
end
