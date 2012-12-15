class Tag < ActiveRecord::Base
  attr_accessible :id,:name
  has_many :taggings,:dependent => :delete_all
  has_many :posts,:through => :taggings
end
