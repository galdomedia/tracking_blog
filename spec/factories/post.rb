Factory.define :post do |p|
  p.title "Sample title"
  p.body "Sample body"
  #p.admin { |admin| admin.association(:admin) }
  p.association :admin, :factory => :admin
end
