class RegisterUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
     user
  end

  private

  attr_accessor :email, :password

  def user
    user = User.create(email: @email, password: @password)
    if user.save
      return user
    else
      errors.add :user_registration, user.errors.messages
    end
    nil
  end
end
