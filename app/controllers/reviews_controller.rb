class ReviewsController < ApplicationController
  before_action :set_meeting, only: [:new, :create]

  def new
    @review = Review.new(meeting: @meeting)
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:notice] = "Review successfully added!"
      redirect_to :root
    else
      render :new
    end
  end

  private
  def set_meeting
    @meeting = Meeting.find_by(share_slug: params[:meeting_id])
  end

  def review_params
    params.require(:review).permit(:usefulness, :agenda_met, :on_topic, :improvements, :other_comments).merge(meeting: @meeting)
  end
end

