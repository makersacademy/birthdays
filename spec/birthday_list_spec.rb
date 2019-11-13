require 'birthday_list'

describe BirthdayList do
  subject { described_class.new }

  it { is_expected.to be_instance_of BirthdayList }
  it { is_expected.to respond_to(:store).with(2).arguments }
end
