RSpec.shared_context 'shared chat line specs' do
  subject { described_class.new({}) }
  it { is_expected.to have_attr_accessor(:state) }
  it { is_expected.to have_attr_accessor(:request_heading) }
  it { is_expected.to have_attr_accessor(:reply_options) }
  it { is_expected.to have_attr_accessor(:mandatory_transition) }
  it { is_expected.to have_attr_accessor(:transitions) }
  it { is_expected.to have_attr_accessor(:reply_regex) }
  it { is_expected.to have_attr_accessor(:user) }
  it { is_expected.to have_attr_accessor(:current_reply) }
  it { is_expected.to have_attr_accessor(:validation_error_message) }

  describe '#set_user_reply' do
    before do
      $stdin = StringIO.new("Nataly\n")
    end

    after do
      $stdin = STDIN
    end

    it "sets #current_reply to Nataly" do
      subject.set_user_reply
      expect(subject.current_reply).to eq('Nataly')
    end
  end

  describe '#reply_valid?' do
    context 'is true' do
      before do
        allow(subject).to receive_messages(
          current_reply: '2 222 222 2222',
          reply_regex: /\A\d{1}\s\d{3}\s\d{3}\s\d{4}\z/
        )
      end
      it 'when reply_regex matches current_reply' do
        expect(subject.reply_valid?).to eq(true)
      end
    end

    context 'puts validation_error_message' do
      before do
        allow(subject).to receive_messages(
          current_reply: 'wrong phone format',
          reply_regex: /\A\d{1}\s\d{3}\s\d{3}\s\d{4}\z/,
          validation_error_message: 'Wrong phone format notication error message.'
        )
      end

      it "when reply_regex doesn't match current_reply" do
        expect(subject).to receive(:puts)
        subject.reply_valid?
      end
    end
  end
end
