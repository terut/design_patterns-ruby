# Strategy: レポートの出力を抽象化したクラス
class Formatter
  def output_report(title, text)
    raise 'Called abstract method!!'
  end
end

# ConcreteStrategy: HTML形式に整形して出力
class HTMLFormatter < Formatter
  def output_report(report)
    puts "<html><head><title>#{report.title}</title></head><body>"
    report.text.each { |line| puts "<p>#{line}</p>" }
    puts "</body></html>"
  end
end

# ConcreteStrategy: PlaneText形式（*****で囲う）に整形して出力
class PlaneTextFormatter < Formatter
  def output_report(report)
    puts "***** #{report.title} *****"
    report.text.each { |line| puts(line) }
  end
end
