require './blog'
require './article'

# Enumerableを試す
require './account'
require './portfolio'

blog = Blog.new
blog.add_article(Article.new("デザインパターン1"))
blog.add_article(Article.new("デザインパターン2"))
blog.add_article(Article.new("デザインパターン3"))
blog.add_article(Article.new("デザインパターン4"))
blog.add_article(Article.new("デザインパターン5"))

iterator = blog.iterator
while iterator.has_next?
  article = iterator.next_article
  puts article.title
end


portfolio = Portfolio.new
portfolio.add_account(Account.new("account1", 1000))
portfolio.add_account(Account.new("account2", 2000))
portfolio.add_account(Account.new("account3", 3000))
portfolio.add_account(Account.new("account4", 4000))
portfolio.add_account(Account.new("account5", 5000))

puts portfolio.any? { |account| account.balance > 3000 }
puts portfolio.all? { |account| account.balance >= 2000 }
