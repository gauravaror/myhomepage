class Photo < ActiveRecord::Base
  attr_accessible :image_uid, :title
  dragonfly_accessor :image
end
