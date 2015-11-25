class BlogIterator
  def initialize(blog)
    @blog = blog
    @index = 0
  end

  def has_next?
    @index < @blog.length
  end

  def next_article
    article = self.has_next? ? @blog.get_article_at(@index) : nil
    @index = @index + 1
    article
  end
end
