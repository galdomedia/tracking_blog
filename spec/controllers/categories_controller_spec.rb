require File.dirname(__FILE__) + '/../spec_helper'

describe CategoriesController do
  include Devise::TestHelpers

  before do
    @admin = Factory.create(:admin)
    sign_in @admin
    @existing_category = Factory.build(:category)
    @existing_category.save
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => @existing_category.to_param
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Category.stub!(:valid?).and_return(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Category.stub!(:valid?).and_return(true)
    post :create, :category=>Factory.attributes_for(:category)
    response.should redirect_to(category_url(assigns[:category]))
  end

  it "edit action should render edit template" do
    get :edit, :id => @existing_category.to_param
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Category.should_receive(:find).with(@existing_category.to_param).and_return(@existing_category)
    @existing_category.stub!(:valid?).and_return(false)
    put :update, :id => @existing_category.to_param
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Category.stub!(:valid?).and_return(true)
    put :update, :id => @existing_category.id
    response.should redirect_to(category_url(assigns[:category]))
  end

  it "destroy action should destroy model and redirect to index action" do
    category = @existing_category
    delete :destroy, :id => category
    response.should redirect_to(categories_url)
    Category.exists?(category.id).should be_false
  end
end
