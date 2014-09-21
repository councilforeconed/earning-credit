class AddPreSurveyScoreAndPostSurveyScoreToStudent < ActiveRecord::Migration
  def change
    add_column :students, :pre_survey_score, :integer
    add_column :students, :post_survey_score, :integer
  end
end
