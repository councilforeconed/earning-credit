class TeachersController < ApplicationController
  before_action :authenticate_teacher!

  def index
    @students = Student.where(teacher_email: current_teacher.email)
  end

end
