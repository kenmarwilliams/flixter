class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :enrolled_in_current_course, only: [:show]
  def show

  end

  private

  def enrolled_in_current_course
    if current_user.enrolled_in?(current_lesson.section.course) != true
      flash[:alert] = "You need to be enrolled in this course to see lesson details."
      redirect_to course_path(@current_lesson.section.course)
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
