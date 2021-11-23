require 'friend'

describe Friend do
	subject {Friend.new}
	let(:gio) {Friend.new("gio", 1990)}

	it 'creates an instance of itself' do
		expect(gio).to be_an_instance_of(Friend)
	end

	it 'creates an instance with a parameter' do
		expect(gio.birthday).to eq 1990
	end


end