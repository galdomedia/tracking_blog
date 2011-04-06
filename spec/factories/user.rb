Factory.define :user do |u|
  u.first_name 'John'
  u.last_name  'Doe'
  u.sequence(:email) { |n| "john_#{n}@trackingrails.com" }
  u.password 'random_password_1'
  u.password_confirmation 'random_password_1'
end

Factory.define :bruce, :parent=>:user do |u|
  u.first_name "Bruce"
  u.last_name "Wayne"
  u.email "batman@gmail.com"
end


