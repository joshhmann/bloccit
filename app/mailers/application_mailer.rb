class ApplicationMailer < ActionMailer::Base
  default from: "doomdhitman@gmail.com"
  layout 'mailer'
  
  def new_comment(user, post, comment)
    headers
end
