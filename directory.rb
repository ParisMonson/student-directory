students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
  ]
# first, we print the list of students
puts "The students of Villain Academy"
puts "-------------"
students.each do |student|
  puts student
end

puts "Overall, we have #{students.count} great students"