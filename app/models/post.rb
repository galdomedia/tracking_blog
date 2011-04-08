class Post < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true

  scope :ordered, order('created_at DESC')

  belongs_to :admin
  belongs_to :category
  
  
  validates :title, :body, :admin_id, :presence=>true

  
  attr_accessible :title, :body, :category_id

end
