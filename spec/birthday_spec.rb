require 'birthday'
require 'date'

describe Birthday do
  let(:date) { Date.new(1899,8,9) }
  subject(:birthday) { described_class.new("Mary Poppins", date) }
  let(:birthday_default) { Birthday.new }

  describe '#name' do
    it 'returns the stored name' do
      expect(birthday.name).to eq("Mary Poppins")
    end
    
    it 'defaults to "Unknown"' do
      expect(birthday_default.name).to eq("Unknown")
    end
  end

  describe '#birthdate' do
    it 'returns the stored birthdate' do
      expect(birthday.birthdate).to eq(date)
    end

    it 'defaults to "Unknown"' do
      expect(birthday_default.birthdate).to eq("Unknown")
    end
  end

  describe '#age' do
    it 'calculates the age today' do
      expect(birthday.age(Date.new(2022,3,2))).to eq 122
    end

    it 'calculates the age on a given day' do
      expect(birthday.age(Date.new(1949,10,15))).to eq 50
    end
  end

  describe '#birthday_today?' do
    context 'birthday is today' do
      it 'returns true' do
        birthday_today = Birthday.new("Mr Today", Date.today)
        expect(birthday_today.birthday_today?(Date.today)).to be true
      end
    end
    context 'birthday is not today' do
      it 'returns false' do
        expect(birthday.birthday_today?(Date.today)).to be false
      end
    end
  end
end
