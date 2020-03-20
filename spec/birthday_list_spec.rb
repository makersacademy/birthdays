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
end