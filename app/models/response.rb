class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :option
  belongs_to :surveys_user
  has_one :survey, through: :question

  validates :option_id, :surveys_user_id, :question_id, presence: true

end
