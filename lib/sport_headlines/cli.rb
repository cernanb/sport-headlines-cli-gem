class SportHeadlines::CLI
  def call
    start
  end

  def start
    puts "Welcome to the Sports Headlines Aggregator."
    puts ""
    puts "Please select a site - by number you would like to view the top headlines from..."
    puts ""
    input = ""
    while input != 'exit'
      input = gets.strip
    end
  end
end
