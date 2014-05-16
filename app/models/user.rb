class User < ActiveRecord::Base
  include BCrypt

	has_many :rounds
	has_many :decks, through: :rounds

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(input_password)
    @password = Password.create(input_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil
  end

end
