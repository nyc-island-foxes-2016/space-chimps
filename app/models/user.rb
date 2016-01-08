require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :surveys_users
  has_many :surveys


  validates :username,  presence: true,
                        uniqueness: { case_sensitive: false },
                        length: { in: 4..20 }


  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
