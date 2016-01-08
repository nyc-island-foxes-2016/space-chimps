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
end
