namespace :crawler do
  desc "Run Crawler..."
  task run: :environment do
    Chosun.run("http://www.chosun.com/site/data/rss/rss.xml")
    Chosun.run("http://myhome.chosun.com/rss/www_section_rss.xml")
    Chosun.run("http://www.chosun.com/site/data/rss/politics.xml")
    Chosun.run("http://www.chosun.com/site/data/rss/international.xml")
    Chosun.run("http://www.chosun.com/site/data/rss/culture.xml")
    Chosun.run("http://www.chosun.com/site/data/rss/editorials.xml")
    Chosun.run("http://inside.chosun.com/rss/rss.xml")

    Joongang.run("http://rss.joins.com/joins_news_list.xml")
    Joongang.run("http://rss.joinsmsn.com/joins_homenews_list.xml")
    Joongang.run("http://rss.joinsmsn.com/joins_money_list.xml")
    Joongang.run("http://rss.joinsmsn.com/joins_life_list.xml")
    Joongang.run("http://rss.joinsmsn.com/news/joins_lifenews_total.xml")
    Joongang.run("http://rss.joinsmsn.com/joins_world_list.xml")
    Joongang.run("http://rss.joinsmsn.com/joins_culture_list.xml")
    Joongang.run("http://rss.joinsmsn.com/news/joins_health_list.xml")
    Joongang.run("http://rss.joinsmsn.com/sonagi/joins_sonagi_total_list.xml")

    Kyounghyang.run("http://www.khan.co.kr/rss/rssdata/total_news.xml")
    Kyounghyang.run("http://www.khan.co.kr/rss/rssdata/opinion.xml")
    Kyounghyang.run("http://www.khan.co.kr/rss/rssdata/politic.xml")
    Kyounghyang.run("http://www.khan.co.kr/rss/rssdata/economy.xml")
    Kyounghyang.run("http://www.khan.co.kr/rss/rssdata/society.xml")
    Kyounghyang.run("http://www.khan.co.kr/rss/rssdata/culture.xml")
    Kyounghyang.run("http://www.khan.co.kr/rss/rssdata/itnews.xml")
    Kyounghyang.run("http://www.khan.co.kr/rss/rssdata/world.xml")

    Mediatoday.run "http://www.mediatoday.co.kr/rss/allArticle.xml"
    Mediatoday.run "http://www.mediatoday.co.kr/rss/clickTop.xml"
    Mediatoday.run "http://www.mediatoday.co.kr/rss/S1N1.xml"
    Mediatoday.run "http://www.mediatoday.co.kr/rss/S1N2.xml"
    Mediatoday.run "http://www.mediatoday.co.kr/rss/S1N3.xml"
    Mediatoday.run "http://www.mediatoday.co.kr/rss/S1N4.xml"
    Mediatoday.run "http://www.mediatoday.co.kr/rss/S1N6.xml"
    Mediatoday.run "http://www.mediatoday.co.kr/rss/S1N9.xml"


    Hani.run "http://www.hani.co.kr/rss/politics/"
    Hani.run "http://www.hani.co.kr/rss/economy/"
    Hani.run "http://www.hani.co.kr/rss/society/"
    Hani.run "http://www.hani.co.kr/rss/international/"
    Hani.run "http://www.hani.co.kr/rss/science/"
    Hani.run "http://www.hani.co.kr/rss/opinion/"
    Hani.run "http://www.hani.co.kr/rss/cartoon/"
    Hani.run "http://www.hani.co.kr/rss/lead/"
    Hani.run "http://www.hani.co.kr/rss/newsrank/"
  end
end
