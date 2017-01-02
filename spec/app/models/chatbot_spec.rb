require 'spec_helper'

RSpec.describe Chatbot do
  it { is_expected.to have_attr_accessor(:current_state) }
  it { is_expected.to have_attr_accessor(:end_states) }
  it { is_expected.to have_attr_accessor(:chat_lines) }
  it { is_expected.to have_attr_accessor(:user) }

  describe '#run' do
    context 'in case valid user reply' do
      let(:chat_line) { double('chatlines instance') }

      before do
        allow(subject).to receive(:current_chat_line).and_return(chat_line)
        allow(subject).to receive(:chat_over?).and_return(false, true)

        allow(chat_line).to receive_messages(
          get_next_state: 'next state',
          reply_valid?: true,
          print_request: nil,
          set_user_reply: nil
        )
      end

      it 'changes current_state' do
        expect { subject.run }.to change { subject.current_state }.to('next state')
      end
    end

    context 'in case invalid user reply' do
      let(:chat_line) { double('chatlines instance') }

      before do
        allow(subject).to receive(:current_chat_line).and_return(chat_line)
        allow(subject).to receive(:chat_over?).and_return(false, true)

        allow(chat_line).to receive_messages(
          get_next_state: 'next state',
          reply_valid?: false,
          print_request: nil,
          set_user_reply: nil
        )
      end

      it 'the current_state remains' do
        expect { subject.run }.not_to change { subject.current_state }
      end
    end
  end
end
