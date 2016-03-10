#top sports headlines scraper
#scrapes top headlines from espn, sportsillustrated, bleacher report, pro football talk

How to Build a CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure
3. Start with the entry point - the file run
4. Force that to build the CLI interface
5. Stub out the interface
6. start making things real
7. discover objects
8. program


"Welcome to the Sports Headlines Aggregator."

"Please select a site - by number you would like to view the top headlines from..."

1. ESPN
2. Sports Illustrated
3. Bleacher Report
4. Pro Football Talk

=> 1. ESPN => list_articles[1-1 = 0]

1. Article 1
2. Article 2
2. Article 3
2. Article 4



# doc = Nokogiri::HTML(open("http://espn.go.com/")) =>
# doc = Nokogiri::HTML(open("http://bleacherreport.com/"))
# doc = Nokogiri::HTML(open("http://www.si.com/"))
# doc = Nokogiri::HTML(open("http://profootballtalk.nbcsports.com/"))
# doc.search("div.headlines li").size => returns each headline li in the top headlines
