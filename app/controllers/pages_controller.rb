class PagesController < ApplicationController
  def index
  end

  def test
    UserMailer.with(user: @user).walk_reminder_email.deliver_now

    redirect_to root_url, success: "Twilio SMS sent!"
  end
end
