class CoursesController < ApplicationController
  before_action:signed_in_trainee
  def show
    @course = Course.find params[:id]
    @course_subjects = @course.course_subjects
    @enrolls = @course.enrolls
  end
end
