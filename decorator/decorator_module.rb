module TimestampingWriterModule
  def write_line(line)
    p "TimestampingWriterModule"
    super("#{Time.new} : #{line}")
  end
end

module NumberingWriterModule
  attr_reader :line_number

  def write_line(line)
    p "NumberingWriterModule"
    @line_number = 1 unless @line_number
    super("#{@line_number} : #{line}")
    @line_number += 1
  end
end
