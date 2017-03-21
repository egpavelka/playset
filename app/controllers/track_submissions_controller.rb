class TrackSubmissionsController < ApplicationController
  # Before 'create' is triggered, run load method.
  before_action :load_track_submission, except: %i(validate_current)

  def validate_current
    @track_submission = current_step_submission(params[:current_step])
    @track_submission.track.attributes = track_submission_params
    session[:track_attributes] = @track_submission.track.attributes

    if @track_submission.valid?
      next_step = next_step_submission(current_step)
      create and return unless next_step
      redirect_to action: next_step
    else
      flash[:danger] = "There were errors."
      render current_step
    end
  end

  def create
    if @track_submission.save
      # @track.media = params[:kind].safe_constantize.new
      flash[:success] = "Track posted successfully."
      redirect_to root_path
    else
      flash[:danger] = "Submission had errors."
      render 'new'
    end
  end

  private

  def track_submission_params
    params.require(:track_submission).permit(:status, :kind, :source_path, :title, :artist, :album, :year)
  end

  def load_track_submission
    @track_submission = current_step_submission(action_name)
  end

  def current_step_submission(step)
    if step.in?(TrackSubmission::STEPS)
      step(session[:track_attributes])
    else
    end
  end

  def next_step_submission(step)
    track_submission.steps[track_submission.steps.index(step + 1)]
  end

end
