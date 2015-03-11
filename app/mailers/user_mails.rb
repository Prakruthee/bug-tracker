class UserMails < ActionMailer::Base
  default  from: "prakruthis320@gmail.com"

  def send_mail(comment)
      @comment = comment
      mail(:to=> @comment.issue.user.email, :subject=>"You got a comment")
  end

end
