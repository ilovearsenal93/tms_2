
class Supervisors::AssignSupervisorsController < ApplicationController
  before_action :signed_in_trainee
  before_action :supervisor_trainee
  before_action :current_course
  before_action :enrolled_course

  def edit
    @supervisors_enrolls = @course.managing_courses
      .paginate(page: params[:page], per_page: 5)
    @supervisors_not_enrolls = Trainee.supervisors_not_enroll_to_courses(@course)
      .paginate(page: params[:page], per_page: 5)
  end

  def create  
    flash[:success] = "Add Supervisor finish"
    @course.managing_courses.create trainee_id: params[:id]
    redirect_to edit_supervisors_course_assign_supervisors_path(@course)
  end

  def destroy
    flash[:success] = "Remove supervisor finish"
    @course.managing_courses.find_by_trainee_id(params[:id]).destroy
    redirect_to edit_supervisors_course_assign_supervisors_path(@course)
  end

  private
    def current_course
      @course = Course.find params[:course_id]
    end
    def enrolled_course
      unless @course.managing_courses.find_by trainee_id: current_trainee.id
        flash[:error] = "You can't assign supervisor to this course"
        redirect_to supervisors_course_url @course
      end
    end
end