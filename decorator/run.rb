require './simple_writer'
require './numbering_writer'
require './timestamping_writer'
require './decorator_module'

writer = NumberingWriter.new(SimpleWriter.new("sample1.txt"))
writer.write_line("日々弾力を失っていく心")
writer.close

writer = TimestampingWriter.new(SimpleWriter.new("sample2.txt"))
writer.write_line("日々弾力を失っていく心")
writer.close

writer = TimestampingWriter.new(NumberingWriter.new(SimpleWriter.new("sample3.txt")))
writer.write_line("日々弾力を失っていく心")
writer.close

writer = SimpleWriter.new("sample4.txt")
# objectに特異メソッドを追加するので、先に呼ばれる
writer.extend NumberingWriterModule
writer.extend TimestampingWriterModule
writer.write_line("日々弾力を失っていく心")
writer.close
