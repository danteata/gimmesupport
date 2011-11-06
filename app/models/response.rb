class Response < ActiveRecord::Base

  validates :content, :presence => true
  validates :member_id, :presence => true
  validates :respondable_id, :presence => true

  belongs_to :respondable,:polymorphic => true, :dependent => :destroy #responses are deleted along with question or suggestion 
  belongs_to :member #need not necessarily delete response when member leaves platform 

end
