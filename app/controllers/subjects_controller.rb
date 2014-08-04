class SubjectsController < ApplicationController
  before_action :signed_in_trainee
  def show
    @trainee_subject = TraineeSubject.find params[:id]
    @subject = @trainee_subject.subject
  end
  def edit
    @trainee = current_trainee
    @trainee_subject = TraineeSubject.find params[:id]
    @subject = @trainee_subject.subject
    @assigned_tasks = @trainee_subject.assigned_tasks
  end
  def update
    @trainee_subject = TraineeSubject.find params[:id]
    @trainee_subject.update_attributes! assigned_task_params
    @trainee_subject.update_attributes! :timecomplete => @timecomplete
    redirect_to edit_subject_path(@trainee_subject.id)
    flash[:success] = "Update successfully"
  end
  private
    def assigned_task_params
      params.require(:trainee_subject).permit(assigned_tasks_attributes:[:id,:status,:timecomplete => @timecomplete])
    end
end
