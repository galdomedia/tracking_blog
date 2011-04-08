Factory.define :admin do |a|
  a.first_name 'John'
  a.last_name  'Doe'
  a.sequence(:email) { |n| "john_#{n}@trackingrails.com" }
  a.password 'random_password_1'
  a.password_confirmation 'random_password_1'
end

Factory.define :bruce, :parent=>:admin do |a|
  a.first_name "Bruce"
  a.last_name "Wayne"
  a.email "batman@gmail.com"
end


