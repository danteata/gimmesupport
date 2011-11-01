class Response < ActiveRecord::Base

  belongs_to :question, :dependent => :destroy #responses are deleted along with question 
  belongs_to :member #need not necessarily delete response when member leaves platform 

end
