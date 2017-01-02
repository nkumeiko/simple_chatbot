Chatbot = Struct.new(:initial_state,
                     :end_states,
                     :chat_lines,
                     :user) do

  attr_accessor :current_state

  def run
    @current_state = initial_state
    until chat_over?
      current_chat_line.print_request
      current_chat_line.set_user_reply
      @current_state = current_chat_line.get_next_state if current_chat_line.reply_valid?
    end
  end

  private

  def chat_over?
    end_states.include?(current_state)
  end

  def current_chat_line
    chat_lines.find { |item| item.state == current_state }
  end
end
