require 'open-uri'
require 'nokogiri'
require 'pry'

class CliDataGemAssessment::Scraper 
  TECHNEWS_URL = "https://www.nytimes.com/section/technology"
  
  def self.scrape_technews
    doc = Nokogiri::HTML(open(TECHNEWS_URL))


    doc.css(".story-body").each do |news|
      CliDataGemAssessment::TechNews.new(news.css("h2.headline").text.strip, news.css("a").attr("href").value, news.css("p.summary").text.strip)
    end
  end
end
