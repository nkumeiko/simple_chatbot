module ChatConfig
  INITIAL_STATE = :conversation_opt_in
  END_STATES = [ :tragic_end, :happy_end ]
  CHAT_LINES = [
    {
      state: :conversation_opt_in,
      request_heading: 'I can help you with answers on all your related questions and help to find a great job!',
      reply_options: [ "Let's talk" ],
      mandatory_transition: :contact_confirmation,
      reply_regex: /.*/
    },
    {
      state: :contact_confirmation,
      request_heading: 'Please enter your name',
      reply_options: { },
      mandatory_transition: :contacts,
      reply_regex: /.+/,
      validation_error_message: "Name can't be empty."
    },
    {
      state: :contacts,
      request_heading: 'Hello USERNAME. How can we reach out to you?',
      reply_options: { '1' => 'Phone', '2' => 'Email', '3' => "I don't want to be contacted" },
      transitions: { '1' => :contacts_phone, '2' => :contacts_email, '3' => :contact_failed },
      reply_regex: /^[123]{1}$/,
      validation_error_message: "Please type '1', '2' or '3'."
    },
    {
      state: :contact_failed,
      request_heading: 'Said to hear that. Whenever you change your mind - feel free to send me a message.',
      reply_options: { },
      mandatory_transition: :tragic_end,
      reply_regex: /.*/
    },
    {
      state: :contacts_phone,
      request_heading: 'Please type your phone number (use format # ### ### ####)',
      reply_options: [ 'Phone input' ],
      mandatory_transition: :contact_time,
      reply_regex: /\A\d{1}\s\d{3}\s\d{3}\s\d{4}\z/,
      validation_error_message: "It seems your phone number has wrong format. Please try again."
    },
    {
      state: :contacts_email,
      request_heading: 'Please type your email address',
      reply_options: [ 'Email input' ],
      mandatory_transition: :contact,
      reply_regex: /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,
      validation_error_message: "It seems your email has wrong format. Please try again."
    },
    {
      state: :contact_time,
      request_heading: 'What is the best time we can reach out to you?',
      reply_options: { '1' => 'ASAP', '2' => 'Morning', '3' => 'Afternoon', '4' => 'Evening' },
      transitions: { '1' => :contact, '2' => :contact, '3' => :contact, '4' => :contact },
      reply_regex: /^[1234]{1}$/,
      validation_error_message: "Please type '1', '2', '3' or '4'."
    },
    {
      state: :contact,
      request_heading: 'We are going to contact you using USER_CHOICE',
      reply_options: { '1' => 'Yes, please', '2' => 'Sorry, wrong email(if email)', '3' => 'Sorry, wrong phone(if phone)' },
      transitions: { '1' => :happy_end, '2' => :contacts_email, '3' => :contacts_phone },
      reply_regex: /^[123]{1}$/,
      validation_error_message: "Please type '1', '2' or '3'."
    }
  ]
end
