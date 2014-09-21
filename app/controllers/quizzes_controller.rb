class QuizzesController < ApplicationController
  
  def pre_survey
    @survey = YAML.load_file('config/pre_survey.yml')
    render 'survey'
  end
  
  def post_survey
    @survey = YAML.load_file('config/pre_survey.yml')
    render 'survey'
  end
  
end
