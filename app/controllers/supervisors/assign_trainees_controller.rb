class Supervisors::AssignTraineesController < ApplicationController
  before_action :signed_in_trainee
  before_action :supervisor_trainee
  before_action :current_course
  before_action :enrolled_course

  def edit
    @trainee_enrolls = @course.enrolls
      .paginate(page: params[:page], per_page: 5)
    @trainee_not_enrolls = Trainee.trainee_not_enroll_to_courses(@course)
      .paginate(page: params[:page], per_page: 5)
  end

  def create
    trainee = Trainee.find params[:id]
    @course.enrolls.create trainee_id: trainee.id      
    flash[:success] = "Add trainee #{trainee.name} finish"
    redirect_to edit_supervisors_course_assign_trainees_path(@course)
  end

  def destroy
    trainee = Trainee.find params[:id]
    @course.enrolls.find_by(trainee_id: trainee.id).destroy      
    flash[:success] = "Remove trainee #{user.name} finish"
    redirect_to edit_supervisors_course_assign_trainees_path @course
  end

  private
  
    def current_course
      @course = Course.find params[:course_id]
    end

    def enrolled_course
      unless @course.managing_courses.find_by trainee_id: current_trainee.id
        flash[:error] = "You can't assign trainee to this course"
        redirect_to supervisors_course_url @course
      end
    end
end