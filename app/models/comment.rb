class Comment < ActiveRecord::Base
  attr_accessible :comment, :email, :name, :post_id
  belongs_to :post
  validates :comment,:email,:name,:post_id, :presence => true
end
