require 'birthday_list'

describe BirthdayList do
  subject { described_class.new }

  it { is_expected.to be_instance_of BirthdayList }
  it { is_expected.to have_attributes birthdays: {} }
  it { is_expected.to respond_to(:store).with(2).arguments }
  it { is_expected.to respond_to(:show).with(0).arguments }
  it { is_expected.to respond_to(:check_today).with(0).arguments }

  describe "#store" do
    it "should store the birthday in @birthdays" do
      subject.store "Alastair", "01/12/1994"
      is_expected.to have_attributes birthdays: 
        { "Alastair" => Date.parse("01/12/1994") }
    end
  end

  describe "#show" do
    it "should print formatted output" do
      subject.store "Alastair", "01/12/1994"
      expected_output = "Name".ljust(30) + "Birthday\n"
      expected_output << "Alastair".ljust(30) + "01/12/1994\n"
      expect { subject.show }.to output(expected_output).to_stdout
    end

    it "shouldn't return anything" do
      subject.store "Biggie", "7/9/1994"
      expect(subject.show).to be_nil
    end
  end

  describe "#check_today" do
    it "should print a message if someone has a birthday today" do
      subject.store "Lionel", Date.today.prev_year(20).prev_day.to_s
      subject.store "Becky", Date.today.prev_year(32).to_s
      subject.store "Freddy", Date.today.prev_year(25).next_month.to_s

      expected_output = "It's Becky's birthday today! They are 32 years old!\n"
      expect { subject.check_today }.to output(expected_output).to_stdout
    end

    it "shouldn't return anything" do
      subject.store "Biggie", "7/9/1994"
      subject.store "Today", Date.today.prev_year(26).to_s
      expect(subject.check_today).to be_nil
    end
  end
end
