class Community < ActiveRecord::Base
  has_attached_file :logo, :styles => {:medium => "300 * 300>", 
                        :thumb => "100* 100>"}

  validates :name, :presence => true
  validates :name, :uniqueness => true
  validates_attachment_presence :logo
  validates_attachment_size :logo, :less_than => 1.megabytes
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png']

  scope :find_company, where(:conditions =>[ "lower(name) = ?", name.downcase ]) 

  def self.find_comp name

  end
end
