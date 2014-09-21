class QuizzesController < ApplicationController
  before_action :ensure_student_is_logged_in
  
  def pre_survey
    @survey = YAML.load_file('config/pre_survey.yml')
    render 'survey'
  end
  
  def post_survey
    @survey = YAML.load_file('config/post_survey.yml')
    render 'survey'
  end
  
end