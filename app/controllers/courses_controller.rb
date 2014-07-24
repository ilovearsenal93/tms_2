class CoursesController < ApplicationController
  before_action:signed_in_trainee
  def show
    @course = Course.find params[:id]
    @course_subjects = @course.course_subjects
    @enrolls = @course.enrolls
    @trainee_subjects = []
    @assigned_tasks = []
    @course.course_subjects.each do |course_subject|
      @trainee_subjects.push(TraineeSubject.find_by(subject_id: course_subject.subject_id))
      course_subject.subject.subject_tasks.each do |subject_task|
        @assigned_tasks.push(AssignedTask.find_by(task_id: subject_task.task_id))
      end
    end
    @activity_log = []
    @enrolls.each do |enroll|
      if enroll.timecomplete != nil 
        @activity_log.push({"description" => "#{enroll.trainee.name} completed #{enroll.course.name}","timecomplete" => enroll.timecomplete})
      else
      end
    end
    @trainee_subjects.each do |trainee_subject|
      if trainee_subject.timecomplete != nil 
        @activity_log.push({"description" => "#{trainee_subject.trainee.name} completed #{trainee_subject.subject.name}","timecomplete" => trainee_subject.timecomplete})
      else
      end
    end
    @assigned_tasks.each do |assigned_task|
      if assigned_task.timecomplete !=nil
        @activity_log.push("description" => "#{assigned_task.trainee.name} completed #{assigned_task.task.task_description}","timecomplete" => assigned_task.timecomplete)
      else
      end
    end
    @activity_log = @activity_log.sort! {|a| a["timecomplete"].to_i}
  end
end
