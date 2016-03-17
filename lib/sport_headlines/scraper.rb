module SportHeadlines::Scraper

  def self.scrape_site_headlines(site)
    doc = Nokogiri::HTML(open(site.site_url))
    site.clear_articles
    if site.site_name == "ESPN"
      doc.search(".headlines li").each do |headline|
        new_article ||= SportHeadlines::Article.new
        new_article.title ||= headline.search("a").text
        new_article.article_url ||= site.site_url + headline.search("a").attribute("href").value
        site.add_article(new_article)
        new_article.site = site
      end
    elsif site.site_name == "Bleacher Report"
      doc.search(".headlineArticles li").each do |headline|
        new_article = SportHeadlines::Article.new
        new_article.title = headline.search("span.title").text
        new_article.article_url = headline.search("a.title").attribute("href").value
        site.add_article(new_article)
        new_article.site = site
      end
    else
      doc.search("#top-headlines li").each do |headline|
        new_article = SportHeadlines::Article.new
        new_article.title = headline.text
        new_article.article_url = headline.search("a").attribute("href").value
        site.add_article(new_article)
        new_article.site = site
      end
    end
  end

  def self.scrape_article(article)
    doc = Nokogiri::HTML(open(article.article_url))
    p_text = ""

    if article.site.site_name == "ESPN"
      doc.search(".article-body p").each do |p|
        p_text += "    " + p.text + "\n\n"
      end
    elsif article.site.site_name == "Bleacher Report"
      doc.search(".article_body p").each do |p|
        p_text += "    " + p.text + "\n"
      end
    elsif article.site.site_name == "Pro Football Talk"
      doc.search(".post-body p").each do |p|
        p_text += "    " + p.text + "\n\n"
      end
    end

    article.content = p_text
  end
end
