class UserMailer < ApplicationMailer
  default from: 'dev.eriel.mf@gmail.com'

  def welcome_email(user)
    @user = user
    @url = "https://futbollll.herokuapp.com/users/sign_in"
    mail to: user.email, subject: "FutbOOOOl Welcomes you."
  end
end
