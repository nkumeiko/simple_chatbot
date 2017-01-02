class ChatBuilder
  attr_accessor :chat_lines, :config

  def initialize(config)
    @chat_lines = []
    @config = config
  end

  def build_chat
    config.each do |chat_line_config|
      add_chat_line(chat_line_config)
    end
    chat_lines
  end

  private

  def add_chat_line(args)
    chat_line_class = "#{args[:state].to_s.camelize}ChatLine".safe_constantize || ChatLine
    chat_lines << chat_line_class.new(args[:state],
                                      args[:request_heading],
                                      args[:reply_options],
                                      args[:mandatory_transition],
                                      args[:transitions],
                                      args[:reply_regex],
                                      args[:user],
                                      args[:validation_error_message])
    self
  end
end
