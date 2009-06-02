module RailstarHelper
  def title(page_title)
    content_for(:title) { page_title }
  end
  
  def stylesheet(*css)
    content_for(:head) { stylesheet_link_tag(*css) }
  end
  
  def javascript(*js)
    content_for(:head) { javascript_include_tag(*js) }
  end

  def auto_discovery_rss(rss)
    content_for(:head) do
      %Q(<link rel="alternate" type="application/rss+xml" href="#{rss}" title="RSS 2.0" />)
    end
  end

  def hbr(str)
    str = html_escape(str)
    br(str)
  end
 
  def br(str)
    str.gsub(/\r\n|\r|\n/, "<br />")
  end
  
  def params_to_hidden_tag(object, options={})
    p = params[object]
    str = ""
    str << hidden_field_tag('back', 1) if options[:back]
    return str unless p
    p.each do |method,value|
      if options[:except] && options[:except].include?(method.to_sym)
      else
        str << hidden_field(object,method, :value => p[method])
      end
    end
    str
  end
end
