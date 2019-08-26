require 'birthday_list'

describe BirthdayList do
  let(:name) { double :name }
  let(:dob) { double :dob}

  describe '#add' do
    it 'confirms when new name and birthday added' do
      expect { subject.add(name, dob) }.to output("#{name} has been added to the list!\n").to_stdout
    end
  end

  describe '#print_list' do
    it 'prints all names and birthdays' do
      subject.add(name, dob)
      expect { subject.print_list }.to output("#{name}: #{dob}\n").to_stdout
    end
  end


end