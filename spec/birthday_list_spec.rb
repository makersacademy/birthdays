# frozen_string_literal: true

require 'birthday_list'
require 'date'

describe BirthdayList do
  it 'responds to adding a birthday' do
    expect(subject).to respond_to(:add)
  end
  it 'adds a birthday and stores it' do
    expect(subject.add('Annie', '23 Dec 1988')).to eq([['Annie', '23 Dec 1988']])
  end

  it 'adds more than one birthday' do
    subject.add('Annie', '23 Dec 1988')
    expect(subject.add('Bob','25 May 1991')).to eq([["Annie", "23 Dec 1988"], ["Bob", "25 May 1991"]])
  end

  it 'prints each birthday on a line in a tidy format' do
    subject.add('Annie', '23 Dec 1988')
    subject.add('Bob','25 May 1991')
    expect{subject.view}.to output("Name: Annie, Birthday: 23 Dec 1988\nName: Bob, Birthday: 25 May 1991\n").to_stdout
  end

  it "checks if today is someone's birthday" do
    subject.add('Bob', '25 May 1991')
    subject.add('Moo', Date.today.strftime('%d %b')+' 1980')
    expect{subject.check}.to output("It's Moo's birthday today! Moo is 41 years old!\n").to_stdout
  end
end
