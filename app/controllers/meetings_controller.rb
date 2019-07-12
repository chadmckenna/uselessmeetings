class MeetingsController < ApplicationController
  def create
    @meeting = Meeting.new(meeting_params)

    @meeting.save
    redirect_to meeting_url(@meeting.review_slug)
  end

  def show
    @meeting = Meeting.find_by(review_slug: params[:id])
  end

  def review
    @meeting = Meeting.find_by(review_slug: params[:meeting_id])
    @results = @meeting.review_results
  end

  private
  def meeting_params
    params.require(:meeting).permit(:title)
  end
end
