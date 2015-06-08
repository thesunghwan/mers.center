class Pile < ActiveRecord::Base
  after_create :after_pile_create

  def after_pile_create
    create_uid
  end

  def create_uid
    uid = loop do
      str = SecureRandom.urlsafe_base64(10, false)
      break str unless Pile.exists?(uid: str)
    end

    self.update_attributes(uid: uid)
  end

  def next
    Pile.where("posted_date > ?", self.posted_date).order(:posted_date).first
  end

  def prev
    Pile.where("posted_date < ?", self.posted_date).order(:posted_date).last
  end
end
