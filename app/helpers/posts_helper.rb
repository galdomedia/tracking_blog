module PostsHelper
  def highlight_source(text)
    puts text
    text.gsub(/\<code( lang=[\'"](.+?)[\'"])?\>(.+?)\<\/code\>/m) do
      puts $2
      puts $3
      CodeRay.scan($3, $2).div(:css => :class)
    end
  end
end
