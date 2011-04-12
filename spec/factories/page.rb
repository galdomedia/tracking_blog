Factory.define :page do |p|
  p.title "Sample title"
  p.body "blablabla"
  p.is_published true
end

Factory.define :secret_page, :parent=>:page do |p|
  p.title "Secred page"
  p.body "This page is very, very secret!"
  p.is_published false
end
