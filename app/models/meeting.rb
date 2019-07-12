class Meeting < ApplicationRecord
  has_many :reviews

  before_create :set_slugs

  def review_results
    return {} if reviews.empty?
    {
      agenda: {
        true: true_results(:agenda),
        false: 1 - true_results(:agenda)
      },
      agenda_met: avg(:agenda_met),
      appropriate_meeting_time: avg(:appropriate_meeting_time),
      appropriate_meeting_length: avg(:appropriate_meeting_length),
      started_on_time: avg(:started_on_time),
      ended_on_time: avg(:ended_on_time),
      action_items: {
        true: true_results(:action_items),
        false: 1 - true_results(:action_items)
      },
      on_topic: avg(:on_topic),
      usefulness: avg(:usefulness),
      necessary_to_attend: avg(:necessary_to_attend),
      ability_to_contribute: avg(:ability_to_contribute)
    }
  end

  private
  def avg(attribute)
    (reviews.map{|r| r.send(attribute)}.reduce(:+) / reviews.count.to_f).round(1)
  end

  def true_results(attribute)
    (reviews.map{|r| r.send(attribute)}.count(true) / reviews.count.to_f).round(1)
  end

  def set_slugs
    loop do
      self.share_slug = SecureRandom.hex(10)
      self.review_slug = SecureRandom.hex(10)
      break unless Meeting.where(share_slug: share_slug).exists? || Meeting.where(review_slug: review_slug).exists?
    end
  end
end
