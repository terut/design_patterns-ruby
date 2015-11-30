require './report'

class HTMLReport < Report
  def output_start
    puts "<thml><head><title>#{@title}</title></head><body>"
  end

  def output_line(line)
    puts "<p>#{line}</p>"
  end

  def output_end
    puts "</body></html>"
  end
end
