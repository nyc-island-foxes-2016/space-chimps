class Option < ActiveRecord::Base
  belongs_to :question
  has_many :responses

  validates   :content,  presence: true,
                      uniqueness: true,
                      length: {
                        in: 4..64,
                        too_short: "must be at least %{count} characters long.",
                        too_long: "is limited to %{count} characters."
                      }

  validates   :question_id, presence: true


end
