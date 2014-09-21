class QuizzesController < ApplicationController
  before_action :ensure_student_is_logged_in
  
  def pre_survey
    return bounce_back_to_student_page unless current_student.eligible_for_pre_survey?
    @type = "pre_survey"
    @survey = YAML.load_file('config/pre_survey.yml')
    render 'survey'
  end
  
  def post_survey
    return bounce_back_to_student_page unless current_student.eligible_for_post_survey?
    @type = "post_survey"
    @survey = YAML.load_file('config/post_survey.yml')
    render 'survey'
  end
  
  def submit_survey
    type = "#{params["type"]}_score=".to_sym
    score = params["answers"].values.map(&:to_i).reduce(&:+) + 300
    current_student.send(type, score)
    if current_student.save
      redirect_to student_path(current_student.id)
    else
      binding.pry
    end
  end
  
  private
  
  def bounce_back_to_student_page
    flash[:alert] = "You're not eligible to take this survey right now, sorry."
    redirect_to student_path(current_student.id)
  end
  
end
