class Report
  def initialize
    @title = "html report title"
    @text = ["report line1", "report line2", "report line3"]
  end

  def output_report
    output_start
    output_body
    output_end
  end

  def output_start
  end

  def output_body
    @text.each do |line|
      output_line(line)
    end
  end

  def output_line(line)
    raise 'Called abstract method!!'
  end

  def output_end
  end
end
