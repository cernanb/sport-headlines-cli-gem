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
      puts "Please select a site - by number you would like to view the top headlines from. Enter exit to end the program"
      puts ""
      list_sites
      puts ""
      input = gets.strip
      if input.to_i.between?(1,sites.size)
        scraper.scrape_site_headlines(sites[input.to_i-1])
        puts "Select an article to read its content."
        puts ""
        sites[input.to_i-1].list_articles
        article_input = gets.strip
        scraper.scrape_article(sites[input.to_i-1].articles[article_input.to_i - 1])
        sites[input.to_i-1].articles[article_input.to_i - 1].print_content
      end
    end
  end

  def list_sites
    SportHeadlines::Site.all.each_with_index do |site, index|
      puts "#{index +1}. #{site.site_name}"
    end
  end
end
