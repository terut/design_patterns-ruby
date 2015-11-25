require './blog_iterator'
class Blog
  def initialize
    @articles = []
  end

  def get_article_at(index)
    @articles[index]
  end

  def add_article(article)
    @articles << article
  end

  def length
    @articles.length
  end

  def iterator
    BlogIterator.new(self)
  end
end
