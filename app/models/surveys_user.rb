class SurveysUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :responses

  validates :survey_id, :user_id, presence: true


  def next_question
    survey_questions = self.survey.questions

    survey_responses = self.responses

    answered_questions = []
    survey_responses.each do |response|
      answered_questions << response.question
    end

    remaining_questions = survey_questions - answered_questions

    remaining_questions.first

  end

end
