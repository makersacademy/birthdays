require 'birthday_list'
require 'timecop'

describe BirthdayList do
  it 'adds the birthday of one friend' do
    birthday_list = BirthdayList.new
    name = 'James'
    birthday = '23/08/1993'

    expect(birthday_list.add(name, birthday)).to eq([{ name: name, birthday: birthday }])
  end
  it 'shows the birthday of two friends' do
    birthday_list = BirthdayList.new    

    birthday_list.add('James', '23/08/1993')
    expect(birthday_list.add('Maria', '05/10/1975')).to eq([{ name: 'James', birthday: '23/08/1993' }, { name: 'Maria', birthday: '05/10/1975' }])
  end
  describe '#show' do
    it 'shows one friend at once on a line' do
      birthday_list = BirthdayList.new

      name = 'James'
      birthday = '23/08/1993'

      birthday_list.add(name, birthday)
      expect { birthday_list.show }.to output("James, 23/08/1993\n").to_stdout
    end
    it 'shows two friends at once on a line' do
      birthday_list = BirthdayList.new

      name_james = 'James'
      bday_james = '23/08/1993'
      name_maria = 'Maria'
      bday_maria = '10/12/1945'

      birthday_list.add(name_james, bday_james)
      birthday_list.add(name_maria, bday_maria)

      expect { birthday_list.show }.to output("#{name_james}, #{bday_james}\n#{name_maria}, #{bday_maria}\n").to_stdout
    end
  end
end
