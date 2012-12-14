class Comment < ActiveRecord::Base
  attr_accessible :comment, :email, :name
  validates :name,:email,:comment, presence => true
  validates :email, :format => { :with => /[a-zA-Z.1-9]*@[a-zA-Z.1-9][a-zA-Z.1-9]/}
  
  
end
