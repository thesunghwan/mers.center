class Api::V1::ArticlesController < ApplicationController
  def show
    last_article_uid = params[:last_article_uid]

    if last_article_uid == Pile.first.uid
      render :json => {
        articles: []
      } and return
    end

    pile = Pile.find_by(uid: last_article_uid)

    if pile
      piles = Pile.where("posted_date < ?", pile.posted_date).order(posted_date: :desc).limit(10)
    else
      piles = Pile.order(posted_date: :desc).limit(10)
    end

    render :json => {
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
