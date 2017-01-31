module Helpers
  include Facebook::Messenger
  # Place for methods that abstract over facebook-messenger Bot functionality 

  # helper function to send messages declaratively and directly
  def say(recipient_id, text, quick_replies = nil)
    message_options = {
    recipient: { id: recipient_id },
    message: { text: text }
    }
    if quick_replies
      message_options[:message][:quick_replies] = quick_replies
    end
    Bot.deliver(message_options, access_token: ENV['ACCESS_TOKEN'])
  end
end
