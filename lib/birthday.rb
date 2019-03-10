class Birthday
  attr_reader :first_name, :second_name, :birthday

  def initialize(first_name, second_name, birthday)
    @first_name = first_name
    @second_name = second_name
    @birthday = birthday
  end

  def name
    "#{@first_name} #{@second_name}"
  end
end
