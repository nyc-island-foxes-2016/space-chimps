class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :option
  belongs_to :surveys_user
  has_one :survey, through: :question

  validates :option_id, :surveys_user_id, :question_id, presence: true

  def next_question_id

    all_questions = self.survey.questions
    surveys_user = SurveysUser.find_by(id: self.surveys_user_id)

    all_answered_questions = []

    all_questions.each do |question|
      all_answered_questions << question.responses.where(surveys_user_id: surveys_user.id)
    end

    all_unanswered_questions = all_questions - all_answered_questions

    # binding.pry

    question_id_bank = []
    all_unanswered_questions.each_with_index do |question, i|
      question_id_bank << (i + 1)
    end
    question_id_bank.shift
  end
end
