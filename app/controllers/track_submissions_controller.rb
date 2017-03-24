class TrackSubmissionsController < ApplicationController
  # Before 'create' is triggered, run load method.
  before_action :load_track_submission, except: %i(validate_current)

  def validate_current
    current_step = params[:current_step]
    @track_submission = current_step_submission(current_step)
    @track_submission.track.attributes = track_submission_params
    session[:track_attributes] = @track_submission.track.attributes

    if @track_submission.valid?
      next_step = next_step_submission(current_step)
      create and return unless next_step
      redirect_to action: next_step
    else
      render current_step
    end
  end

  def create
    if @track_submission.save
      @track = current_user.track.build(session[:track_attributes])
      flash[:success] = "Track posted successfully."
      redirect_to root_path
    else
      flash[:danger] = "Submission had errors."
      redirect_to({ action: TrackSubmission::STEPS.first })
    end
  end

  private

  def track_submission_params
    params.require(:track_submission).permit(:status, :kind, :media_sources, :title, :artist, :album, :year)
  end

  def load_track_submission
    @track_submission = current_step_submission(action_name)
  end

  def current_step_submission(step)
    if step.in?(TrackSubmission::STEPS)
      "TrackSubmission::#{step.camelize}".constantize.new(session[:track_attributes])
    else
      flash[:danger] = "TrackSubmission::#{step.camelize}"
    end
  end

  def next_step_submission(step)
    TrackSubmission::STEPS[TrackSubmission::STEPS.index(step) + 1]
  end

end
