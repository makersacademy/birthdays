require 'birthday_list'

describe BirthdayList do
	subject {BirthdayList.new}

	context "initialization"
	it 'creates an instance of itself' do
		expect(subject).to be_an_instance_of(BirthdayList)
	end

	context "Array as the birthday list"
	it 'creates an empty array of birthdays when instantiated' do
		expect(subject.birthdays).to eq ([])
	end

	it 'has a #store_birthday method' do
		expect(subject).to respond_to(:store_birthday).with(1).argument
	end

	context "An array of hashes"
	it "stores hashes into the empty array" do
		friend = double(:friend, name: "Chandler", birthday: "23/11/1980" ) 
		subject.store_birthday(friend)
		expect(subject.birthdays.size).to eq 1
	end

	context "birthday_today?"
	it 'has a #birthday_today? method' do
		expect(subject).to respond_to(:birthday_today?)
	end

	context "Checks today's birthdays"
	it "iterates through birthdays arrays and displays today's birthday" do
		friend2 = double(:friend, name: "Joey", birthday: "23/11/1981")
		subject.store_birthday(friend2) 
		expect(subject.birthday_today?).to eq "It's Joey's birthday today! They are 40 years old!"
	end
	

end