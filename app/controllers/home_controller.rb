class HomeController < ApplicationController
  def index
    @posts = Post.ordered.limit(5).all
  end

end
