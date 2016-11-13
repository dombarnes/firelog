module ApplicationHelpers
  def current?(path = '/')
    request.path_info == path ? 'current' : nil
  end

  def link_to(text, url, opts = {})
    attributes = ''
    opts.each do |k, v|
      attributes << k.to_s << '="' << v << '" ' if k && v
    end
    %(<a href="#{url}" #{attributes}>#{text}</a>)
  end

  def yes_no(bool)
    if bool == true
      "Yes"
    else
      "No"
    end
  end
end
