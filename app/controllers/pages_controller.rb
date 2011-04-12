class PagesController < ApplicationController
  before_filter :authenticate_admin!, :except=>[:show]
  before_filter :find_page, :except=>[:index, :new, :create]
  before_filter :check_if_is_published?, :only=>[:show]
  
  def index
    @pages = Page.all
  end

  def show
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to @page, :notice => "Successfully created page."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @page.update_attributes(params[:page])
      redirect_to @page, :notice  => "Successfully updated page."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @page.destroy
    redirect_to pages_url, :notice => "Successfully destroyed page."
  end
  
  def find_page
    @page = Page.find(params[:id])
  end
  private :find_page
  
  def check_if_is_published?
    redirect_to(root_url) if not @page.is_published and not admin_signed_in?
  end
  private :check_if_is_published?
  
  
end
