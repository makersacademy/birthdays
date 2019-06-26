
$birthdays = []

def add_birthday(name,dob)
  entry = {name => dob}
  $birthdays.push(entry)
  return "Name stored!"
end


def check_birthdays
  return $birthdays
end
