class SurveysUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :responses

  validates :survey_id, :user_id, presence: true

end
