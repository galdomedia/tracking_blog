class Category < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true
  has_ancestry :cache_depth=>true
  
  validates :name, :presence=>true
  attr_accessible :name, :parent_id
end
