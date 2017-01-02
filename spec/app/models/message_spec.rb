require 'spec_helper'

RSpec.describe Message do
  it { is_expected.to have_attr_accessor(:datetime) }
  it { is_expected.to have_attr_accessor(:message) }
end
