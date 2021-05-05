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
end
