class CategoriesController < ApplicationController
  before_filter :authenticate_admin!
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to @category, :notice => "Successfully created category."
    else
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to @category, :notice  => "Successfully updated category."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to categories_url, :notice => "Successfully destroyed category."
  end

  def reorder
  end
  
  def sort
    params['item'].each_pair do |key, value|
      c =@prefix.find(key)
      id,pos = value.split('--')
      c.parent_id = id=="root" ? nil : id
      c.position = pos
      c.save
    end

    render :nothing => true
  end


end
