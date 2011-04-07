class PostsController < ApplicationController
  before_filter :authenticate_admin!, :except=>[:show, :feed]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
    @post.admin = current_admin
    if @post.save
      redirect_to @post, :notice => "Successfully created post."
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to @post, :notice  => "Successfully updated post."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url, :notice => "Successfully destroyed post."
  end

  def feed
    @title = Settings.blog_name
    @posts = Post.ordered.all
    # Feed's update timestamp
    @updated = @posts.first.updated_at unless @posts.empty?

    respond_to do |format|
      format.atom { render :layout => false }
      format.rss { redirect_to feed_posts_path(:format => :atom), :status => :moved_permanently }
    end
  end

  def by_month
    return(redirect_to(root_url)) if params[:m].blank?
    begin
      @d = Time.parse(params[:m])
    rescue
      return(redirect_to(root_url)) 
    end
    @posts = Post.ordered.where('created_at > ?', @d.beginning_of_month).where('created_at < ?', @d.end_of_month).all
  end
  
end
