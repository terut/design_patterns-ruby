# Client
require './printer'
require './adapter'

p = Printer.new(Adapter.new("Hello"))
p.print_weak
p.print_strong

## Rubyなら特異メソッドを利用してAdapterクラスを省略できる
# textオブジェクト(OldPrinter)にAdapterの役割を持つ得意メソッドを追加
#
# text = OldPrinter.new("Hello")
# def text.print_weak
#   show_with_bracket
# end
# def text.print_strong
#   show_with_asterisk
# end
#
# p = Printer.new(text)
# p.print_weak
# p.print_strong
