require 'coderay'
module PostsHelper
  def highlight_source(text)
    text.gsub(/\<code\s(lang=[\'"](.+?)[\'"])?\>(.+?)\<\/code\>/m) do
      CodeRay.scan($3, $2).div(:css => :class)
    end
  end
end
