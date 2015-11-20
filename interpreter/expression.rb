# AbstractExpression: 命令・抽象的な表現
class Expression
  def |(other)
    Or.new(self, other)
  end

  def &(other)
    And.new(self, other)
  end
end
