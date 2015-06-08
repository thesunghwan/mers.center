class PagesController < ApplicationController
  def home
  end

  def articles
    uid = params[:uid]
    pile = Pile.find_by(uid: uid)
    @pile = {
      next: pile.next,
      prev: pile.prev,
      uid: pile.uid,
      title: pile.title,
      publisher: pile.publisher,
      posted_date: pile.posted_date,
      description: pile.description,
      original_link: pile.original_link
    }
  end

  def rumors
  end

  def news
    path = request.env['PATH_INFO']

    if path == "/news/featured"
      @piles = Pile.where(curation: true).order(posted_date: :desc).limit(20)
    elsif path == "/news/government"
      @piles = Pile.where(pile_type: "government").order(posted_date: :desc).limit(20)
    else
      @piles = Pile.order(posted_date: :desc).limit(20)
    end
  end
end
