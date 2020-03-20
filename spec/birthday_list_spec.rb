require 'birthday_list'

describe BirthdayTracker do
  subject { BirthdayTracker.new }

  describe "#store" do
    it "responds" do
      expect(subject).to respond_to :store
    end
    it "accepts two arguments" do
      expect(subject).to respond_to(:store).with(2).arguments
    end
  end

  describe "#all" do
    it "responds" do
      expect(subject).to respond_to :all
    end
  end
end

# subject.store("Chris", "1985-03-20")