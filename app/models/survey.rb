class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :surveys_users
  has_many :questions
  has_many :responses, through: :questions

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

  def self.created_and_not_created_by(this_user, surveys_array)
    surveys_created_by_user = []
    surveys_not_created_by_user = []

    surveys_array.each do |survey|
      if survey.user == this_user
        surveys_created_by_user << survey
      else
        surveys_not_created_by_user << survey
      end
    end

    return [surveys_created_by_user, surveys_not_created_by_user]
  end

  def has_been_taken_by?(user)
    !!SurveysUser.find_by(user: user, survey: self)
  end

  def self.taken_and_not_taken_by(user, surveys_array)
    surveys_taken = []
    surveys_not_taken = []

    surveys_array.each do |survey|
      if survey.has_been_taken_by? user
        surveys_taken << survey
      else
        surveys_not_taken << survey
      end
    end

    return [surveys_taken, surveys_not_taken]
  end

end
