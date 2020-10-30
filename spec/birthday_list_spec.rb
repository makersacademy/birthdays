require 'birthday_list'

describe Birthdays do
  describe "#print_header" do
    it "outputs to stdout" do
      expect { Birthdays.new.print_header }.to output.to_stdout
    end
  end
end