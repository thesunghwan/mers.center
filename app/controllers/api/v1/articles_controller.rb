class Api::V1::ArticlesController < ApplicationController
  def show
    news_type = params[:news_type]
    last_article_uid = params[:last_article_uid]

    if news_type.nil? or last_article_uid == Pile.first.uid
      render :json => {
        error: Error.create(Error::NO_ERROR, nil),
        articles: []
      } and return
    end

    pile = Pile.find_by(uid: last_article_uid)
    if pile
      if news_type == "featured"
        piles = Pile.featured_news.where("posted_date < ?", pile.posted_date).order(posted_date: :desc).limit(20)
      elsif news_type == "government"
        piles = Pile.government_news.where("posted_date < ?", pile.posted_date).order(posted_date: :desc).limit(20)
      else
        piles = Pile.where("posted_date < ?", pile.posted_date).order(posted_date: :desc).limit(20)
      end
    else
      piles = Pile.order(posted_date: :desc).limit(20)
    end

    render :json => {
      error: Error.create(Error::NO_ERROR, nil),
      articles: piles
    }
  end

  def curate
    article_uid = params[:article_uid]

    pile = Pile.find_by(uid: article_uid)
    if pile
      pile.update_attributes(curation: true)
      render :json => {
        error: Error.create(Error::NO_ERROR, nil)
      }
    else
      render :json => {
        error: Error.create(Error::NOT_FOUND_DATA, "article")
      }
    end
  end
end
