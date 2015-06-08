require 'open-uri'
require 'net/http'

class Mediatoday
  def self.run rss_origin
    rss = Nokogiri::XML(open(rss_origin))
    items = rss.css("item")

    for item in items
      if item.at_xpath("title").content.include? "메르스"
        title = item.at_xpath("title").content.strip
        original_link = item.at_xpath("link").content.strip
        description = item.at_xpath("description").content.strip
        pubDate = DateTime.strptime(item.at_xpath("pubDate").content, '%Y-%m-%d %H:%M:%S') - 9.hours
        author = item.at_xpath("author").content.strip
        publisher = "미디어오늘"

        if Pile.where(title: title).count == 0
          Pile.create({
            title: title,
            original_link: original_link,
            description: description,
            posted_date: pubDate,
            author: author,
            publisher: publisher,
            pile_type: "news"
          })
        end
      end
    end
  end
end
