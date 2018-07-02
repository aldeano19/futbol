class UserMailer < ApplicationMailer
  default from: 'erieljr@aol.com'

  def welcome_email(user)
    @user = user
    @url = "https://futbollll.herokuapp.com/users/sign_in"
    mail to: "erieljr1@gmail.com", subject: "FutbOOOOl Welcomes you."
  end
end
