# Terminalexpression: 終端となる表現（構造木の葉）
# 与えられたパターンとマッチする全てのファイル名を返す
require 'find'
class FileName < Expression
  def initialize(pattern)
    @pattern = pattern
  end

  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      name = File.basename(p)
      results << p if File.fnmatch(@pattern, name)
    end
    results
  end
end
