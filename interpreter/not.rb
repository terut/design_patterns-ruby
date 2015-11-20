# NonterminalExpression: 終端以外の表現（構造木の節）
# 否定の適用
require './all'
class Not < Expression
  def initialize(expression)
    @expression = expression
  end

  def evaluate(dir)
    All.new.evaluate(dir) - @expression.evaluate(dir)
  end
end
