class Post < ActiveRecord::Base
  attr_accessible :content, :tag, :title
  validates :content,:title , :presence => true
  validate :title, :length => { :maximum => 150}
  belongs_to :user
end
