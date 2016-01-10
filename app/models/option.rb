class Option < ActiveRecord::Base
  belongs_to :question
  has_many :responses

  validates   :content,  presence: true,
                      length: {
                        in: 1..64,
                        too_short: "must be at least %{count} characters long.",
                        too_long: "is limited to %{count} characters."
                      }

  validates   :question_id, presence: true


end
