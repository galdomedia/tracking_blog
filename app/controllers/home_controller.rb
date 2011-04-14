class HomeController < ApplicationController
  def index
    @posts = Post.ordered.limit(2).all
  end

end
