students = []

def input_students
  puts "Please enter the name of the student"
  students = []
  name = gets.chomp
  puts "Please enter their cohort:"
  cohort = gets.chomp
  while !name.empty? do
    
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    puts "Please enter the name of the student"
    name = gets.chomp
    unless name.empty?
      puts "Please enter their cohort:"
      cohort = gets.chomp
      cohort == "" ? cohort = "Unknown" : nil
    end
  end
  students
end

def print_header
  puts "The students of Villain Academy".center(100)
  puts "--------------------------".center(100)
end

def print(names)
  names_printed = 0
  cohort_list = []
  
  for i in names do
    i.each { |k, v|
      k == :cohort && !cohort_list.include?(v) ? cohort_list << v : nil
    }
    
  end
  
  cohort_list.each do |cohort|
    names.each do |hash|
      hash.each do |k, v|
        if k == :cohort && v == cohort
          puts "#{names_printed + 1}. #{hash[:name]} (#{hash[:cohort]})".center(100)
          names_printed += 1
        end
    end
  end
  end
end

def print_footer(names)
  unless names.length == 1
    puts "Overall, we have #{names.count} great students".center(100)
    puts "--------------------------".center(100)
  else
    puts "Overall, we have #{names.count} great student".center(100)
    puts "--------------------------".center(100)
  end
end

def interactive_menu()
  students = []
  loop do
  # Show user list of options
    puts "1. Inputs the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
  # Do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        print_header
        print(students)
        print_footer(students)
      when "9"
        exit
      else
        puts "I dont know what you mean, try again"
    end
  # Repeat from step 1
  end
end

print_header
print(students)
print_footer(students)