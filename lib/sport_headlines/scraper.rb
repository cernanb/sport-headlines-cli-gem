module SportHeadlines::Scraper

  def self.scrape_site_headlines(site)
    doc = Nokogiri::HTML(open(site.site_url))

    if site.site_name == "ESPN"
      doc.search(".headlines li").each do |headline|
        new_article = SportHeadlines::Article.new
        new_article.title = headline.search("a").text
        new_article.article_url = site.site_url + headline.search("a").attribute("href").value
        site.add_article(new_article)
      end
    elsif site.site_name == "Sports Illustrated"
      doc.search(".top-stories-tile .tile-body li").each do |headline|
        new_article = SportHeadlines::Article.new
        new_article.title = headline.search("a").text
        new_article.article_url = headline.search("a").attribute("href").value
        site.add_article(new_article)
      end
    elsif site.site_name == "Bleacher Report"
      doc.search(".headlineArticles li").each do |headline|
        new_article = SportHeadlines::Article.new
        new_article.title = headline.search("span.title").text
        new_article.article_url = headline.search("a.title").attribute("href").value
        site.add_article(new_article)
      end
    else
      doc.search("#top-headlines li").each do |headline|
        new_article = SportHeadlines::Article.new
        new_article.title = headline.text
        new_article.article_url = headline.search("a").attribute("href").value
        site.add_article(new_article)
      end
    end
  end
end
