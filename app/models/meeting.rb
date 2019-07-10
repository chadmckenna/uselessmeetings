class Meeting < ApplicationRecord
  has_many :reviews

  before_create :set_slugs

  private
  def set_slugs
    loop do
      self.share_slug = SecureRandom.hex(10)
      self.review_slug = SecureRandom.hex(10)
      break unless Meeting.where(share_slug: share_slug).exists? || Meeting.where(review_slug: review_slug).exists?
    end
  end
end
