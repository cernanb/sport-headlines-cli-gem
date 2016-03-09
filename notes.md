#top sports headlines scraper
#scrapes top headlines from espn, sportsillustrated, bleacher report, pro football talk


# doc = Nokogiri::HTML(open("http://espn.go.com/")) =>
# doc.search("div.headlines li").size => returns each headline li in the top headlines

SportHeadlines::CLI
SportHeadlines::Site
SportHeadlines::Article

How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure
3. Start with the entry point - the file run
4. Force that to build the CLI interface
5. Stub out the interface
6. start making things real
7. discover objects
8. program
