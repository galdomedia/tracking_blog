class Page < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true

  scope :published, where('is_published=?', true)

  validates :title, :presence=>true


  attr_accessible :title, :body, :is_published
end
