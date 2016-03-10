class SportHeadlines::Site
  attr_accessor :site_name, :site_url, :articles

  SITES = {
        "ESPN" => "http://espn.go.com/",
        "Sports Illustrated" => "http://www.si.com/",
        "Bleacher Report" => "http://bleacherreport.com/",
        "Pro Football Talk" => "http://profootballtalk.nbcsports.com/"
  }

  @@all = []

  def initialize(site_name, site_url)
    @site_name = site_name
    @site_url = site_url
    @articles = []
    @@all << self
  end

  def self.all
    @@all
  end

  def self.create_sites_from_hash
    SITES.each do |site, url|
      self.new(site, url)
    end
  end

  def add_article(article)
    self.articles << article
  end

  def list_articles
    self.articles.each_with_index do |article, index|
      puts "#{index + 1}. #{article.title}"
    end
  end

end
