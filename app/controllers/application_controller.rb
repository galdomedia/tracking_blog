class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :fetch_sidebar_content


  def fetch_sidebar_content
    @posts_months = Post.all.group_by { |p| p.created_at.beginning_of_month }
  end

end
