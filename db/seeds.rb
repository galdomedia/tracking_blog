# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
#

a = Admin.first
if a.blank?
  a = Admin.new({:first_name=>"Tracking", :last_name=>"Rails", :email=>"admin@trackingrails.com", :password=>"test123", :password_confirmation=>"test123"})
  a.save
end
