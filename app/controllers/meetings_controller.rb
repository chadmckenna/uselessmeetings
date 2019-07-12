class MeetingsController < ApplicationController
  def create
    @meeting = Meeting.new(meeting_params)

    if @meeting.save
      flash[:notice] = "Your review for meeting `#{@meeting.title}` has been created."
      redirect_to meeting_url(@meeting.review_slug)
    else
      flash[:error] = "We could not create a meeting review, please try again"
      redirect_to :root
    end
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
