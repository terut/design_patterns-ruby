# Decorator 行番号出力
require './writer_decorator_refactoring'
class NumberingWriter < WriterDecoratorRefactoring
  def initialize(real_writer)
    super(real_writer)
    @line_number = 1
  end

  def write_line(line)
    @real_writer.write_line("#{@line_number} : #{line}")
  end
end
