class BirthdayTracker
  def initialize
    @storage = Hash.new
  end

  attr_reader :storage

  def store(name, dob)
    
    @storage[name] = dob 
  end

  def all
    @storage.each do |name, dob|
      puts "#{name}: #{dob}"
    end
  end
end
