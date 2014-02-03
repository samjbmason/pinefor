class GiftMailer < ActionMailer::Base
  default from: "hello@pinefor.it"

  def deleted_notification(gift)
    @gift = gift
    @user = @gift.user
    @list_user = @gift.list.user
    mail(to: @user.email, subject: "A gift you are buying has been deleted")
  end
end
