class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :responses
  has_many :options

  validates   :content, presence: true,
                        length: {
                          in: 3..250,
                          too_short: "must be at least %{count} characters long.",
                          too_long: "is limited to %{count} characters."
                        }

  validates   :survey_id, presence: true

  def compiled_results
    question_results = {}

    question_results["content"] = self.content
    question_results["responses_count"] = self.responses.count

    question_options = []

    self.options.each do |option|
      key = option.content.to_sym
      question_options << ({key => Response.where(option_id: option.id).count})
    end
    question_results["options"] = question_options

    question_results
  end

end
