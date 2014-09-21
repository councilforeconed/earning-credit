class Student < ActiveRecord::Base

  before_validation(on: :create) do
    self.access_code = rand.to_s[2..7]
  end

  validates :name, presence: true
  validates :access_code, presence: true
  validates :teacher_email, format: {
    with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    message: "must be a valid email address."
  }

  def eligible_for_pre_survey?
    pre_survey_score.nil? && post_survey_score.nil?
  end

  def eligible_for_post_survey?
    pre_survey_score && post_survey_score.nil?
  end

  def eligible_for_loan_with_score(score)
    if pre_survey_score && post_survey_score
      pre_survey_score > score || post_survey_score > score
    else
      pre_survey_score > score
    end
  end

end
