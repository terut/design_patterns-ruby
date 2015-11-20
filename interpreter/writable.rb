# TerminalExpression: 終端となる表現（構造木の葉）
# 書き込み可能なファイルを返す
require 'find'
class Writable < Expression
  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      results << p if File.writable?(p)
    end
    results
  end
end
