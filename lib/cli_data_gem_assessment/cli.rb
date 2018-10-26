class CliDataGemAssessment::Cli 
  def run
    welcome
    CliDataGemAssessment::Scraper.scrape_technews
    menu
  end

  def welcome 
    puts "--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--"
    puts "           Welcome to the NYT Tech News Scraper!                 ".colorize(:light_blue)
  end

  def menu
    puts "  For the latest tech news, please select an article by number:  ".colorize(:light_blue)
    puts "--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--"
    list_news
    input
  end

  def list_news
    CliDataGemAssessment::TechNews.all[1..10].each.with_index(1) do |news, i| 
      puts "#{i}. #{news.headline}"
  end
end

  def input
    input = gets.chomp#.to_i
    news = CliDataGemAssessment::TechNews.all[1..10][input.to_i - 1]
    if news.class == CliDataGemAssessment::TechNews && input.to_i > 0 
      puts "--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--"
      puts "                          #{news.headline.colorize(:light_blue)}                                              "
      puts "--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--"
      puts "#{news.summary}"
      puts "---------------------------------------------------------------------------------------------------------------"
      puts "                          For further tech news information, click the url below:                              ".colorize(:light_blue)
      puts "           #{news.url}                                                                                         "
      puts "---------------------------------------------------------------------------------------------------------------"
      puts "                                      Would you like to read more?                                             ".colorize(:light_blue)
      puts "                         Type 'menu' for the main menu, or 'exit' to exit the program.                         "
      final_selection
    elsif input == "exit" 
      goodbye
    else
      puts "--> Invalid selection. Please try again using a valid number. <--".colorize(:magenta)
      menu
    end
  end

  def goodbye
      puts "--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--"
      puts "                        Don't forget to come back for tomorrow's latest tech news!                            ".colorize(:magenta)
      puts "--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--.--"
  end

  def final_selection
    input = gets.chomp.downcase
    if input == "menu"
      menu
      #list_news
   elsif input == "exit" 
      goodbye
   else 
    puts "--> Invalid selection. Please try again using a valid selection. <--".colorize(:magenta)
    menu
    end
  end

end

