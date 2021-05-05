require 'birthday_list'
require 'timecop'

describe BirthdayList do

  before :example do
    @birthday_list = BirthdayList.new
  end

  it 'adds the birthday of one friend' do

    name = 'James'
    birthday = '23/08/1993'

    expect(@birthday_list.add(name, birthday)).to eq([{ name: name, birthday: birthday }])
  end

  it 'shows the birthday of two friends' do

    @birthday_list.add('James', '23/08/1993')
    expect(@birthday_list.add('Maria', '05/10/1975')).to eq([{ name: 'James', birthday: '23/08/1993' }, { name: 'Maria', birthday: '05/10/1975' }])
  end

  describe '#show' do
    it 'shows one friend at once on a line' do

      name = 'James'
      birthday = '23/08/1993'

      @birthday_list.add(name, birthday)
      expect { @birthday_list.show }.to output("James, 23/08/1993\n").to_stdout
    end

    it 'shows two friends at once on a line' do

      name_james = 'James'
      bday_james = '23/08/1993'
      name_maria = 'Maria'
      bday_maria = '10/12/1945'

      @birthday_list.add(name_james, bday_james)
      @birthday_list.add(name_maria, bday_maria)

      expect { @birthday_list.show }.to output("#{name_james}, #{bday_james}\n#{name_maria}, #{bday_maria}\n").to_stdout
    end
  end

  describe '#check' do
    context 'checks if today any friend has birthday' do
      it 'shows message for friend who has birthday today' do
        Timecop.freeze(Time.parse('05/05/2021'))

        name = 'James'
        birthday = '05/05/1923'

        @birthday_list.add(name, birthday)
        expect { @birthday_list.check }.to output("James's birthday. 98 years old\n").to_stdout
      end

      it 'shows nothing when no friend has birthday today' do
        Timecop.freeze(Time.parse('05/05/2021'))

        name = 'James'
        birthday = '09/05/1923'

        @birthday_list.add(name, birthday)
        expect { @birthday_list.check }.to output("").to_stdout
      end
    end
  end
end
