students = []
# first, we print the list of students
def print_header
  puts "The students of Villain Academy"
  puts "-------------"
end

def print(names)
  names.each_with_index do |names, index|
    puts "#{index + 1}. #{names[:name]} (#{names[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    
    name = gets.chomp
  end
  
  students
end

students = input_students
print_header
print(students)
print_footer(students)