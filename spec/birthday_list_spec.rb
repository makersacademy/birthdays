require 'birthday_list'

RSpec.describe Birthdays do

  it { is_expected.to be_kind_of(Birthdays) }
  # test the methods
  it { is_expected.to respond_to(:add_birthday) }
  it { is_expected.to respond_to(:show_all) }
  it { is_expected.to respond_to(:match_birthday) }
end
