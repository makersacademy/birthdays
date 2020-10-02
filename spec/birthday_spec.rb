require 'birthday'

describe Birthday do

    it "gets a written date" do
        bday = Birthday.new("Duckie", "23/10/1993")
        expect(bday.written_date).to eq("October 23, 1993")
    end

    it "calculates a person's age" do 
        person = Birthday.new("Duckie", minus_25_years)
        expect(person.get_age).to eq(25)
    end
end

def minus_25_years
    current = Date.today
    "#{current.day}/#{current.month}/#{current.year - 25}"
end