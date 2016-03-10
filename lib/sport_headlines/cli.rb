class SportHeadlines::CLI
  def call
    puts "Welcome to the Sports Headlines Aggregator."
    puts ""
    SportHeadlines::Site.create_sites_from_hash
    start
  end

  def start
    sites = SportHeadlines::Site.all
    scraper = SportHeadlines::Scraper
    puts ""
    input = nil
    while input != 'exit'
      puts "Please select a site - by number you would like to view the top headlines from..."
      puts ""
      list_sites
      puts ""
      input = gets.strip
      if input.to_i.between?(1,4)
        scraper.scrape_site_headlines(sites[input.to_i-1])
        sites[input.to_i-1].list_articles
      end
    end
  end

  def list_sites
    SportHeadlines::Site.all.each_with_index do |site, index|
      puts "#{index +1}. #{site.site_name}"
    end
  end
end
