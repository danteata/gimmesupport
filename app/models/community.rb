class Community < ActiveRecord::Base
  has_attached_file :logo, :styles => {:medium => "300 * 300>", 
                        :thumb => "100* 100>"}
end
