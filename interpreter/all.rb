# TerminalExpression: 終端となる表現(構造木の葉)
# 全てのファイルを返す
require 'find'
class All < Expression
  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      results << p
    end
    results
  end
end
