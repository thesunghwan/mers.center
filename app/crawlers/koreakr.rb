require 'open-uri'
require 'net/http'

class Koreakr
  def self.run rss_origin
    rss = Nokogiri::XML(open(rss_origin))
    items = rss.css("item")

    for item in items
      if item.at_xpath("title").content.include? "메르스"
        title = item.at_xpath("title").content.strip
        original_link = item.at_xpath("link").content.strip
        description = item.at_xpath("description").content.strip
        posted_date = DateTime.httpdate(item.at_xpath("pubDate").content[0..-4] + "GMT") - 9.hours
        publisher = "정책브리핑"

        if Pile.where(title: title).count == 0
          Pile.create({
            title: title,
            original_link: original_link,
            description: description,
            posted_date: posted_date,
            publisher: publisher,
            pile_type: "government"
          })
        end
      end
    end
  end
end
