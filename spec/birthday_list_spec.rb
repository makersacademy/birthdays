require 'birthday_list'

describe BirthdayList do
  subject { described_class.new }

  it { is_expected.to be_instance_of BirthdayList }
  it { is_expected.to have_attributes birthdays: {} }
  it { is_expected.to respond_to(:store).with(2).arguments }
  it { is_expected.to respond_to(:show).with(0).arguments }

  describe "#store" do
    it "should store the birthday in @birthdays" do
      subject.store "Alastair", "01/12/1994"
      is_expected.to have_attributes birthdays: {"Alastair" => "01/12/1994"}
    end
  end

  describe "#show" do
    it "should print formatted output" do
      subject.store "Alastair", "01/12/1994"
      expected_output = "Name".ljust(30) + "Birthday\n"
      expected_output << "Alastair".ljust(30) + "01/12/1994\n"
      expect{ subject.show }.to output(expected_output).to_stdout
    end
  end
end
