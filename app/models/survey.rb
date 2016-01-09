class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :surveys_users
  has_many :questions

  validates   :name,  presence: true,
                      uniqueness: true,
                      length: {
                        in: 4..64,
                        too_short: "must be at least %{count} characters long.",
                        too_long: "is limited to %{count} characters."
                      }

  validates   :description, presence: true,
                        length: {
                          in: 3..250,
                          too_short: "must be at least %{count} characters long.",
                          too_long: "is limited to %{count} characters."
                        }

  validates   :user_id, presence: true

  # def de_sinatrafying_array(survey)

  def next_question_id
    question_id_bank = []
    self.questions.each_with_index do |question, i|
      question_id_bank << (i + 1)
    end
    question_id_bank.shift
  end

end
