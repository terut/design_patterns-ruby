# Decorator タイムスタンプ出力
require './writer_decorator_refactoring'
class TimestampingWriter < WriterDecoratorRefactoring
  def write_line(line)
    @real_writer.write_line("#{Time.new} : #{line}")
  end
end
