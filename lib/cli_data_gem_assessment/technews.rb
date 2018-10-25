class CliDataGemAssessment::TechNews
  attr_accessor :headline, :summary, :url
  @@all = []

  def initialize (headline, url, summary)
    self.headline = headline.gsub("â", "")
    self.url = url
    self.summary = summary.gsub("â", "")
    self.save
  end

  def self.all
    @@all 
  end

  def save 
    self.class.all << self
  end

end
