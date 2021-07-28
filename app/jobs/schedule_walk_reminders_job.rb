require 'twilio-ruby'

class ScheduleWalkRemindersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    account_sid = Rails.application.credentials.dig(:twilio, :account_sid)
    auth_token = Rails.application.credentials.dig(:twilio, :auth_token)
    client = Twilio::REST::Client.new(account_sid, auth_token)

    dog = Dog.find_by(name: "Boomer")
    message = client.messages.create(
      body: "Time to walk #{dog.name}!",
      to: "+18182884761",
      from: "+19856063541"
    )

    puts message.sid
  end
end
