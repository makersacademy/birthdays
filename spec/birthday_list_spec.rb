require 'birthday_list'

describe BirthdayList do
  let(:output_string1) { "Alastair".ljust(30) + "01/01/1991" }
  let(:output_string2) { "Charlie B".ljust(30) + "08/08/1967" }
  let(:b_day_age) { 28 }
  let(:not_b_day_age) { 30 }
  let(:b_day_today) { double(:birthday,
                             name: "Alastair",
                             display_string: output_string1,
                             today?: true,
                             age: b_day_age)
  }
  let(:b_day_not_today) { double(:birthday,
                                 name: "Charlie B",
                                 display_string: output_string2,
                                 today?: false,
                                 age: not_b_day_age)
  }

  it { is_expected.to respond_to(:store).with(1).arguments }

  describe "#show" do
    it "shouldn't print anything if empty" do
      expect { subject.show }.to_not output.to_stdout
    end

    it "should print formatted output for one person" do
      subject.store b_day_today
      expected_output = "Name".ljust(30) + "Birthday\n"
      expected_output << output_string1 + "\n"
      expect { subject.show }.to output(expected_output).to_stdout
    end

    it "should print formatted output for multiple people" do
      subject.store b_day_today
      subject.store b_day_not_today
      expected_output = "Name".ljust(30) + "Birthday\n"
      expected_output << output_string1 + "\n"
      expected_output << output_string2 + "\n"
      expect { subject.show }.to output(expected_output).to_stdout
    end

    it "shouldn't return anything" do
      subject.store b_day_today
      allow($stdout).to receive(:write)
      expect(subject.show).to be_nil
    end
  end

  describe "#check_today" do
    it "should print a message if someone has a birthday today" do
      2.times { subject.store b_day_not_today }
      subject.store b_day_today
      2.times { subject.store b_day_not_today }

      expected_output = "It's Alastair's birthday today!"
      expected_output << " They are #{b_day_age} years old!\n"
      expect { subject.check_today }.to output(expected_output).to_stdout
    end

    it "shouldn't print anything if no-one has a birthay" do
      5.times { subject.store b_day_not_today }
      expect { subject.check_today }.to_not output.to_stdout
    end

    it "shouldn't return anything" do
      2.times { subject.store b_day_not_today }
      subject.store b_day_today
      2.times { subject.store b_day_not_today }

      allow($stdout).to receive(:write)
      expect(subject.check_today).to be_nil
    end
  end
end
