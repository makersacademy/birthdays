require 'birthday_list'
require 'Date'

describe 'Birthday List' do
  it 'can add a birthday' do
    birthday1 = double('birthday', :name => 'Amit Tauro', :formatted_date => '04/06/1992')
    birthdaylist = BirthdayList.new
    expect(birthdaylist.add(birthday1)).to eq(birthday1)
  end

  it 'can show an empty list' do
    birthdaylist = BirthdayList.new
    expect { birthdaylist.show }.to output("Name: Birthday\n").to_stdout
  end

  it 'can show a list with one entry' do
    birthday1 = double('birthday', :name => 'Amit Tauro',
      :formatted_date => '04/06/1992', :last_name => 'Tauro')
    birthdaylist = BirthdayList.new
    birthdaylist.add(birthday1)
    expect { birthdaylist.show }.to output("Name: Birthday\nAmit Tauro: 04/06/1992\n").to_stdout
  end

  it 'can show a list with multiple entries' do
    birthday1 = double("birthday", :name => "Amit Tauro",
       :formatted_date => "04/06/1992", :last_name => "Tauro")
    birthday2 = double("birthday", :name => "Jack Watson",
      :formatted_date => "08/09/1993", :last_name => "Watson")
    birthdaylist = BirthdayList.new
    birthdaylist.add(birthday1)
    birthdaylist.add(birthday2)
    solution =
    ["Name: Birthday",
    "Amit Tauro: 04/06/1992",
    "Jack Watson: 08/09/1993\n"]
    expect { birthdaylist.show }.to output(solution.join("\n")).to_stdout
  end

  it 'can sort a list by surname' do
    birthday1 = double("birthday", :name => "Amit Tauro",
       :formatted_date => "04/06/1992", :last_name => "Tauro")
    birthday2 = double("birthday", :name => "Jack Watson",
       :formatted_date => "08/09/1993", :last_name => "Watson")
    birthdaylist = BirthdayList.new
    birthdaylist.add(birthday2)
    birthdaylist.add(birthday1)
    solution =
    ["Name: Birthday",
    "Amit Tauro: 04/06/1992",
    "Jack Watson: 08/09/1993\n"]
    expect { birthdaylist.show }.to output(solution.join("\n")).to_stdout
  end

  it 'can find a birthday for someone born today' do
    birthday1 = double("birthday", :name => "Amit Tauro", :date => Date.new(2020,9,14),
      :age => "0")
    birthdaylist = BirthdayList.new
    birthdaylist.add(birthday1)
    expect { birthdaylist.find_birthday_today }.to output(
      "It's Amit Tauro's birthday today! They are 0 years old!\n").to_stdout
  end

  it 'can find a birthday for someone born last year' do
    birthday1 = double("birthday", :name => "Amit Tauro", :date => Date.new(1992,9,14),
      :age => "28")
    birthdaylist = BirthdayList.new
    birthdaylist.add(birthday1)
    expect { birthdaylist.find_birthday_today }.to output(
      "It's Amit Tauro's birthday today! They are 28 years old!\n").to_stdout
  end

  it 'can find a birthday from multiple birthdays' do
    birthday1 = double("birthday", :name => "Amit Tauro", :date => Date.new(1992,9,14),
      :age => "28")
    birthday2 =  double("birthday", :name => "Jack Watson", :date => Date.new(1992,6,4),
      :age => "28")
    birthdaylist = BirthdayList.new
    birthdaylist.add(birthday1)
    birthdaylist.add(birthday2)
    expect { birthdaylist.find_birthday_today }.to output(
      "It's Amit Tauro's birthday today! They are 28 years old!\n").to_stdout
  end
end
