class StudentsController < ApplicationController
  
  def index
    if current_student
      redirect_to student_path(current_student.id)
    else
      redirect_to root
    end
  end
  
  def create
    if access_code = params[:student][:access_code]
      @student = Student.find_by(access_code: access_code)
      session[:student] = @student.id
      redirect_to student_path(@student.id)
    else
      @student = Student.new(student_params)
      if @student.save
        redirect_to student_path(@student.id)
        session[:student] = @student.id
      else
        render "new"
      end
    end
  end
  
  def new
    @student = Student.new
  end
  
  def show
    @student = current_student
  end
  
  def destroy
    session[:student] = nil
    redirect_to new_student_path
  end
  
  private
  
  def student_params
    params.require(:student).permit(:name, :teacher_email, :section_code, :student_id)
  end
  
end
