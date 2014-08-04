class Supervisors::CourseSubjectsController < ApplicationController
  before_action :correct_trainee
  before_action :course_started, only: [:edit, :update]

  def show
    @enrolls = current_trainee.enrolls.find_by_course_id @course.id
  end

  def edit
    @enrolls = @course.course_subjects.find_by_subject_id @subject.id
  end

  def update
    if params[:submit] = "Start"
      @course_subject = @course.course_subjects.find_by_subject_id @subject.id
      
    end
     flash[:success] = "Start success!"
    redirect_to edit_supervisors_course_course_subject_path @course, @subject
  end

  private
  
    def load_object
      @course = Course.find params[:course_id]      
      @subject = Subject.find params[:id]
      unless @course.subjects.include? @subject
        flash[:error] = "Subject not belong to this course!"
        redirect_to supervisors_course_url @course
      end
    end

    def correct_trainee
      managing_course = current_trainee.managing_courses.find_by course_id: @course.id
      if managing_course.nil?
        flash[:error] = "You not have permit to update this course progress!"
        redirect_to supervisors_courses_url
      end
    end

    def course_started
      unless @course.started?
        redirect_to supervisors_course_url @course
      end
    end
end