require 'birthday_list'
require 'timecop'

RSpec.describe BirthdayList do
  # add my friends’ birthdays

  it 'adds a birthday' do
    birthday_list = BirthdayList.new

    result = [{ name: 'Guy Fawkes', birthday: "13 April 1570" }]
    expect(birthday_list.add('Guy Fawkes', "13 April 1570")).to eq result
  end

  it 'adds two birthdays' do
    birthday_list = BirthdayList.new
    birthday_list.add('Guy Fawkes', "13 April 1570")

    result = [{ name: 'Guy Fawkes', birthday: "13 April 1570" },
              { name: 'Julie Andrews', birthday: "1 October 1935" }]
    expect(birthday_list.add('Julie Andrews', "1 October 1935")).to eq result
  end

  # see them all there with their names

  it 'shows all the birthdays' do
    birthday_list = BirthdayList.new
    birthday_list.add('Guy Fawkes', "13 April 1570")
    birthday_list.add('Julie Andrews', "1 October 1935")

    result = "Guy Fawkes: 13 April 1570\nJulie Andrews: 1 October 1935\n"
    expect { birthday_list.show }.to output(result).to_stdout
  end

  # Check who’s birthday it is today

  it 'checks birthdays for a birthday today' do
    Timecop.freeze(Time.parse('1 October 2018')) do

      birthday_list = BirthdayList.new
      birthday_list.add('Guy Fawkes', "13 April 1570")
      birthday_list.add('Julie Andrews', "1 October 1935")

      result = "It's Julie Andrews's birthday today! They are 83 years old!\n"
      expect { birthday_list.check }.to output(result).to_stdout
    end
  end

  it 'checks birthdays for a birthday - but there are none' do
    birthday_list = BirthdayList.new
    birthday_list.add('Guy Fawkes', "13 April 1570")
    birthday_list.add('Julie Andrews', "1 October 1935")

    expect { birthday_list.check }.not_to output().to_stdout
  end
end
