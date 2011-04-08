require File.dirname(__FILE__) + '/../spec_helper'

describe PostsController do
  include Devise::TestHelpers

  before do
    @admin = Factory.create(:admin)
    sign_in @admin
    @existing_post = Factory.build(:post)
    @existing_post.admin=@admin
    @existing_post.save
  end
  

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => @existing_post.to_param
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Post.stub!(:valid?).and_return(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Post.stub!(:valid?).and_return(true)
    post :create, :post=>Factory.attributes_for(:post)
    response.should redirect_to(post_url(assigns[:post]))
  end

  it "edit action should render edit template" do
    get :edit, :id => @existing_post.to_param
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Post.should_receive(:find).with(@existing_post.to_param).and_return(@existing_post)
    @existing_post.stub!(:valid?).and_return(false)
    put :update, :id => @existing_post.to_param
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Post.stub!(:valid?).and_return(true)
    put :update, :id => @existing_post.to_param
    response.should redirect_to(post_url(assigns[:post]))
  end

  it "destroy action should destroy model and redirect to index action" do
    post = @existing_post.to_param
    delete :destroy, :id => post
    response.should redirect_to(posts_url)
    Post.exists?(post.id).should be_false
  end
end
