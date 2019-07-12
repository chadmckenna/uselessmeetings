class ReviewsController < ApplicationController
  before_action :set_meeting, only: [:new, :create]

  def new
    @review = Review.new(meeting: @meeting)
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:notice] = "Thank you for reviewing `#{@review.meeting.title}`. Your review has been successfully submitted to the organizer."
      redirect_to :root
    else
      flash[:error] = @review.errors.full_messages
      render :new
    end
  end

  private
  def set_meeting
    @meeting = Meeting.find_by(share_slug: params[:meeting_id])
  end

  def review_params
    params.require(:review).permit(
      :agenda,
      :agenda_met,
      :appropriate_meeting_time,
      :appropriate_meeting_length,
      :started_on_time,
      :ended_on_time,
      :action_items,
      :on_topic,
      :usefulness,
      :necessary_to_attend,
      :ability_to_contribute,
      :improvements,
      :other_comments
    ).merge(meeting: @meeting)
  end
end

