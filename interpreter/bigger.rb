# TerminalExpression: 終端となる表現（構造木の葉）
# 指定したファイルサイズより大きいファイルを返す
require 'find'
class Bigger < Expression
  def initialize(size)
    @size = size
  end

  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      results << p if File.size(p) > @size
    end
    results
  end
end
