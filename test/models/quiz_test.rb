require 'test_helper'

class QuizTest < ActiveSupport::TestCase
  test "there is a quiz class" do
    assert Quiz
  end
  
  test "it has a type" do
    quiz = Quiz.new('pre_survey', 'config/pre_survey.yml')
    assert_equal quiz.type, 'pre_survey'
  end
  
  test "it has questions" do
    quiz = Quiz.new('pre_survey', 'config/pre_survey.yml')
    assert_respond_to quiz, :questions
  end
end
