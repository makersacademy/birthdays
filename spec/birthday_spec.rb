require 'birthday'

describe Birthday do
  let(:default_name) { "Alastair Name" }
  let(:default_date) { "01/09/1971" }
  subject { described_class.new(default_name, default_date) }

  def birthday_today name, age
    date = Date.today.prev_year(age).to_s
    described_class.new(default_name, date)
  end

  def birthday_not_today name, age
    date = Date.today.prev_year(age).prev_day(rand(1..364)).to_s
    p date
    described_class.new(default_name, date)
  end

  it { is_expected.to be_instance_of Birthday }

  it { is_expected.to respond_to :display_string }

  describe "#display_string" do
    it "should return a formatted string" do
      expected_result = default_name.ljust(30) + default_date
      expect(subject.display_string).to eq expected_result
    end
  end

  it { is_expected.to respond_to :today? }

  describe "#today?" do
    it "should return true if it is today" do
      birthday = birthday_today default_name, 30
      expect(birthday.today?).to be true
    end

    it "should return false if it isn't today" do
      birthday = birthday_not_today default_name, 30
      expect(birthday.today?).to be false
    end
  end

  it { is_expected.to respond_to :age }

  describe "#age" do
    it "should return an Integer" do
      expect(subject.age).to be_instance_of Integer
    end

    it "should return the age correctly if it's today" do
      age = rand(1..160)
      birthday = birthday_today(default_name, age)
      expect(birthday.age).to eq age
    end

    it "should return the age correctly if it isn't today" do
      age = rand(1..160)
      birthday = birthday_not_today(default_name, age)
      expect(birthday.age).to eq age
    end

    it "should return the age correctly if birthday is tomorrow" do
      date = Date.today.prev_year(30).next_day.to_s
      birthday = described_class.new(default_name, date)
      expect(birthday.age).to eq 29
    end
  end
end
