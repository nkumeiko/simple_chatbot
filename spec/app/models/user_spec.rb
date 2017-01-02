require 'spec_helper'

RSpec.describe User do
  it { is_expected.to have_attr_accessor(:username) }
  it { is_expected.to have_attr_accessor(:user_phone) }
  it { is_expected.to have_attr_accessor(:user_email) }
end
