class Post < ActiveRecord::Base
  attr_accessible :tag_names,:id,:content, :title
  has_many :comments, :dependent => :delete_all
  has_many :taggings,:dependent => :delete_all
  has_many :tags,:through => :taggings,:dependent => :delete_all
  validates :content,:title , :presence => true
  validate :title, :length => { :maximum => 150}
  belongs_to :user
  attr_writer :tag_names
  after_save :assign_tags

  def tag_names
    @tag_names || tags.map(&:name).join(' ')
  end
  
  def assign_tags
    if @tag_names
      self.tags = @tag_names.split(/\,/).map do |name|
        Tag.find_or_create_by_name(name)
    end
   end
  end

end
