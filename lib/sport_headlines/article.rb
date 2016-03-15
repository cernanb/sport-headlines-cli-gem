class SportHeadlines::Article
  attr_accessor :title, :content, :article_url, :site

  def print_content
    puts self.content
    puts ""
  end

end
