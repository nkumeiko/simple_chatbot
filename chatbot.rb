ENV['RACK_ENV'] ||= 'development'
require_relative 'config/boot'

user = User.create

Chatbot.new(ChatConfig::INITIAL_STATE,
            ChatConfig::END_STATES,
            ChatBuilder.new(ChatConfig::CHAT_LINES
              .map { |chat_line| chat_line.merge(user: user) }).build_chat,
            user)
  .run
