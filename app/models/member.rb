class Member < ActiveRecord::Base

  has_attached_file :avatar, :styles => {:medium => "300 * 300>", 
                        :thumb => "100* 100>"}
  validates :user_name, :presence => true

  validates_attachment_size :avatar, :less_than => 1.megabytes
  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']
end
