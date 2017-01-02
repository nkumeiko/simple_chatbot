ChatLine = Struct.new(:state,
                      :request_heading,
                      :reply_options,
                      :mandatory_transition,
                      :transitions,
                      :reply_regex,
                      :user,
                      :validation_error_message) do

  attr_accessor :current_reply

  def print_request
    prepared_request = prepare_request(request)
    puts prepared_request
    Message.log(prepared_request, user)
  end

  def set_user_reply
    @current_reply = gets.strip
  end

  def get_next_state
    Message.log(current_reply, user)
    after_reply
    mandatory_transition || transitions[current_reply]
  end

  def reply_valid?
    return true if reply_regex =~ current_reply
    puts validation_error_message.to_s
    false
  end

  private

  def prepare_request(request)
    request
  end

  def after_reply
    # can be overriden in subclasses
  end

  def request
    "#{request_heading}\n#{refined_reply_options}"
  end

  def refined_reply_options
    case reply_options
      when Hash
        reply_options.inject('') { |result, option| result + "(#{option[0]}) #{option[1]}\n" }
      when Array
        reply_options.join(' ')
      else
        raise ArgumentError, 'Wrong reply option type'
    end
  end
end
