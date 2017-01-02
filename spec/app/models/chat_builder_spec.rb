require 'spec_helper'

RSpec.describe ChatBuilder do
  let(:chat_lines_config) { [
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
    }] }
  subject { described_class.new(chat_lines_config) }
  it { is_expected.to have_attr_accessor(:chat_lines) }
  it { is_expected.to have_attr_accessor(:config) }

  describe '#build_chat' do
    it 'returns array of chat_line objects' do
      expect(subject.build_chat.map(&:class)).to match_array([ChatLine, ContactConfirmationChatLine])
    end
  end
end
