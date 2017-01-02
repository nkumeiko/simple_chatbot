require 'spec_helper'

RSpec.describe ChatConfig do
  describe '::CHAT_LINES' do
    subject { described_class::CHAT_LINES }
    it 'defines valid chatlines' do
      is_expected.to be_a(Array)
    end
  end

  describe '::INITIAL_STATE' do
    subject { described_class::INITIAL_STATE }
    it 'has value' do
      is_expected.not_to be_empty
    end
  end

  describe '::END_STATES' do
    subject { described_class::END_STATES }
    it 'has value' do
      is_expected.not_to be_empty
    end
  end
end
