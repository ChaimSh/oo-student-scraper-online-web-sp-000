require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  attr_accessor :students

  def self.scrape_index_page(index_url)
  index_html = open(index_url)
  index_doc = Nokogiri::HTML(index_html)
  student_cards = index_doc.css(".student-card")
  students = []
  student_cards.collect do |info|
   students << {
     :name => info.css("h4.student-name").text,
     :location => info.css("p.student-location").text,
     :profile_url => info.css("a").attribute('href').value
   }

   end
   students
  end

  def self.scrape_profile_page(profile_url)
    profile_html = open(profile_url)
    profile_doc = Nokogiri::HTML(profile_html)
    students_sm = {}
    profile_doc.css("div.social-icon-container a").each do |info|
        info.attribute("href")

    end
  end

end
