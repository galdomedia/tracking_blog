class Post < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true

  scope :ordered, order('created_at DESC')

  belongs_to :admin

  
  
  validates :title, :body, :presence=>true

  
  attr_accessible :title, :body

end
