require "birthday"

describe Birthday do

  context "initialize" do

    it "should store a name" do
      birthday = Birthday.new("Kim", 13, 5, 1991)
      expect(birthday.name).to eq "Kim"
    end

    it "should store a day" do
      birthday = Birthday.new("Kim", 13, 5, 1991)
      expect(birthday.day).to eq 13
    end

    it "should store a month" do
      birthday = Birthday.new("Kim", 13, 5, 1991)
      expect(birthday.month).to eq 5
    end

    it "should store a year" do
      birthday = Birthday.new("Kim", 13, 5, 1991)
      expect(birthday.year).to eq 1991
    end

  end



  context "Birthday initialized" do
    before do
      @birthday = Birthday.new("Kim", 13, 5, 1991)
    end



    it "should be able to calculate an age" do
      expect(@birthday.calculate_age).to eq 30
    end
  end



end