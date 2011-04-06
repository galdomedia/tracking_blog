Factory.define :post do |p|
  p.title "Sample title"
  p.body "Sample body"
  p.admin { |admin| author.association(:admin) }
end
