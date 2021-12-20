# Preview all emails at http://localhost:3000/rails/mailers/user_miler_mailer
class UserMilerMailerPreview < ActionMailer::Preview
  def welcome  
    UserMilerMailer.with(to: "igrashi@example.com", name: "igaiga").welcome
  end
end
