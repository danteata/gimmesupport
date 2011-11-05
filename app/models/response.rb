class Response < ActiveRecord::Base
  belongs_to :post

  validates :content, :presence => true
  validates :member_id, :presence => true
  validates :question_id, :presence => true

  belongs_to :question, :dependent => :destroy #responses are deleted along with question 
  belongs_to :member #need not necessarily delete response when member leaves platform 

end
