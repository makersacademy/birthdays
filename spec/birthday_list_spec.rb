require 'birthday_list'

describe BirthdayTracker do
  subject { BirthdayTracker.new }

  describe '#store' do
    it 'responds' do
      expect(subject).to respond_to :store
    end
    it 'accepts two arguments' do
      expect(subject).to respond_to(:store).with(2).arguments
    end
  end

  describe "@storage" do
    it "responds" do
      expect(subject).to respond_to :storage
    end
  end

  describe '#all' do
    it 'responds' do
      expect(subject).to respond_to :all
    end
    it 'prints a list of a stored friend and birthday' do
      subject.store('Chris', '1985-03-20')
      expect { subject.all }.to output("Chris: 1985-03-20\n").to_stdout
    end
    it 'prints two stored friends and birthdays' do
      subject.store('Chris', '1985-03-20')
      subject.store('Daisy', '1995-04-10')
      expect { subject.all }.to output("Chris: 1985-03-20\nDaisy: 1995-04-10\n").to_stdout
    end
  end

  describe '#today' do
    it "responds" do
      expect(subject).to respond_to :today
    end
  end
end
