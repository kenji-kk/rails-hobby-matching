class UserMilerMailer < ApplicationMailer
  def welcomodule
    @name = params[:name]
    mail(to: params[:to], subject:'登録完了')
  end
end
