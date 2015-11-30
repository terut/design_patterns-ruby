require './report'

class PlainTextReport < Report
  def output_start
    puts " ***** #{@title} *****"
  end

  def output_line(line)
    puts line
  end
end
