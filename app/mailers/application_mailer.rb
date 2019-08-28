class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@manager-bold.com'
  layout 'mailer'

  def completed_task_mail
    @user = params[:user]
    # @url = "https://manager-bold.herokuapp.com/"
    mail(to: @user.email, subject: 'Congratulations')
  end
end
