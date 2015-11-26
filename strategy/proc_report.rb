# Procを使ってStrategyを表現することもできる

class ProcReport
  attr_reader :title, :text
  attr_accessor :formatter

  def initialize(&formatter)
    @title = 'report title'
    @text = %w(text1 text2 text3)
    @formatter = formatter
  end

  def output_report
    @formatter.call(self)
  end
end

HTML_FORMATTER = ->(context) do
  puts "<html><head><title>#{context.title}</title></head><body>"
  context.text.each { |line| puts "<p>#{line}</p>" }
  puts "</body></html>"
end

PLANE_TEXT_FORMATTER = ->(context) do
  puts "***** #{context.title} *****"
  context.text.each { |line| puts(line) }
end
