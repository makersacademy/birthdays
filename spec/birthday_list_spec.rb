require 'birthday_list'

describe BirthdayList do
  subject { described_class.new }
  def random_set_up birthday_list
    today = Date.today
    names = [
      "Alastair Gilles",
      "Antonija Kuhak",
      "Fred Merrit",
      "Lisa McMann",
      "Tilly Henason"
    ]
    names.each do |name|
      subject.store name, today.prev_year(rand(14..98)).prev_day(rand(1..363)).to_s
    end
  end

  def add_birthday_for_today birthday_list, name
    age = rand(3..98)
    birthday_list.store name, Date.today.prev_year(age).to_s
    return age
  end

  it { is_expected.to be_instance_of BirthdayList }
  it { is_expected.to respond_to(:store).with(2).arguments }
  it { is_expected.to respond_to(:show).with(0).arguments }
  it { is_expected.to respond_to(:check_today).with(0).arguments }

  describe "#show" do
    it "shouldn't print anything if empty" do
      expect { subject.show }.to_not output.to_stdout
    end

    it "should print formatted output for one person" do
      subject.store "Alastair", "01/12/1994"
      expected_output = "Name".ljust(30) + "Birthday\n"
      expected_output << "Alastair".ljust(30) + "01/12/1994\n"
      expect { subject.show }.to output(expected_output).to_stdout
    end

    it "should print formatted output for multiple people" do
      subject.store "Alastair", "01/12/1994"
      subject.store "Jenny", "17/09/1987"
      expected_output = "Name".ljust(30) + "Birthday\n"
      expected_output << "Alastair".ljust(30) + "01/12/1994\n"
      expected_output << "Jenny".ljust(30) + "17/09/1987\n"
      expect { subject.show }.to output(expected_output).to_stdout
    end

    it "shouldn't return anything" do
      subject.store "Biggie", "7/9/1994"
      allow($stdout).to receive(:write)
      expect(subject.show).to be_nil
    end
  end

  describe "#check_today" do
    it "should print a message if someone has a birthday today" do
      random_set_up subject
      age = add_birthday_for_today subject, "Becky"

      expected_output = "It's Becky's birthday today! They are #{age} years old!\n"
      expect { subject.check_today }.to output(expected_output).to_stdout
    end

    it "shouldn't print anything if no-one has a birthay" do
      random_set_up subject
      expect { subject.check_today }.to_not output.to_stdout
    end

    it "shouldn't return anything" do
      random_set_up subject
      add_birthday_for_today subject, "Print this, no return"
      allow($stdout).to receive(:write)
      expect(subject.check_today).to be_nil
    end
  end
end
