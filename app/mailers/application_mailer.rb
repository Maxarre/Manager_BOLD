class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@manager-bold.com'
  layout 'mailer'

  def completed_task_mail
    @user = params[:user]
    @list = params[:list]
    @task = params[:task]
    # @url = "https://manager-bold.herokuapp.com/"
    attachments.inline["unicorn.png"] = File.read("#{Rails.root}/app/assets/images/unicorn.png")
    mail(to: @user.email, subject: 'Congratulations')
  end
end
