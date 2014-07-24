class SubjectsController < ApplicationController
  before_action:signed_in_trainee
  def show
    @subject = Subject.find params[:id]
    @subject_tasks = @subject.subject_tasks
    @assigned_task_list = current_trainee.assigned_tasks
    @assigned_task_list.each do |assigned_task|
      if (@subject_tasks.find_by_id(assigned_task.task_id).nil?)
      assigned_task.destroy
      else 
      end
    end
    @trainee_subject = @subject.trainee_subjects.find_by(trainee_id: current_trainee.id)
  end
  def update
    unless params[:task_checkbox].nil?
    params[:task_checkbox].each do |task_id,check|
        t = current_trainee.assigned_tasks.find_by(task_id: task_id)
        t.update_attributes(:status => "F",:timecomplete => Time.now)
      end
    else
    end
    render "new"
  end
end
