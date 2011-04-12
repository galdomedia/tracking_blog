require File.dirname(__FILE__) + '/../spec_helper'

describe PagesController do
  include Devise::TestHelpers

  before do
    @admin = Factory.create(:admin)
    sign_in @admin
    @existing_page = Factory.build(:page)
    @existing_page.save
  end

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  context "visiting page" do
    it "show action should render show template" do
      get :show, :id => @existing_page.to_param
      response.should render_template(:show)
    end

    it "should show hidden page to signed in admin " do
      get :show, :id => Factory.create(:secret_page).to_param
      response.should render_template(:show)
    end

    it "should redirect to root_url if anonymous user is visiting hidden page" do
      sign_out @admin
      get :show, :id => Factory.create(:secret_page).to_param
      response.should redirect_to(root_url)
    end
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Page.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Page.any_instance.stubs(:valid?).returns(true)
    post :create, :page=>Factory.attributes_for(:page)
    response.should redirect_to(page_url(assigns[:page]))
  end

  it "edit action should render edit template" do
    get :edit, :id => @existing_page.to_param
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Page.should_receive(:find).with(@existing_page.to_param).and_return(@existing_page)
    @existing_page.stub!(:valid?).and_return(false)
    put :update, :id => @existing_page.to_param
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Page.any_instance.stubs(:valid?).returns(true)
    put :update, :id => @existing_page.to_param
    response.should redirect_to(page_url(assigns[:page]))
  end

  it "destroy action should destroy model and redirect to index action" do
    page = @existing_page
    delete :destroy, :id => page
    response.should redirect_to(pages_url)
    Page.exists?(page.id).should be_false
  end
end
