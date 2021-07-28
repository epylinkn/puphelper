class UserMailer < ApplicationMailer
  default from: 'info@puphelper.com'

  def walk_reminder_email
    @user = params[:user]
    notify(telephone: "+18182884761", body: "Time to walk your pup!")
    notify(telephone: "+14158899841", body: "Time to walk your pup!")
  end

  private

  def notify(options = {})
    if options[:telephone]
      account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
      auth_token = Rails.application.credentials.dig(:twilio, :auth_token)
      @client = Twilio::REST::Client.new(account_sid, auth_token)

      message = @client.messages.create(
        body: options[:body],
        to: options[:telephone],
        from: "+19856063541"
      )

      puts message.sid
    end
  end
end
