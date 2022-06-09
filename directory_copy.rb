@students =[]

def input_students
  puts "Please enter the name of the student"
  name = gets.chomp
  puts "Please enter their cohort:"
  cohort = gets.chomp
  while !name.empty? do
    
    @students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{@students.count} students"
    puts "Please enter the name of the student or press Enter to finish."
    name = gets.chomp
    unless name.empty?
      puts "Please enter their cohort:"
      cohort = gets.chomp
      cohort == "" ? cohort = "Unknown" : nil
    end
  end
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
  unless names.length <= 1
    puts "Overall, we have #{names.count} great students".center(100)
    puts "--------------------------".center(100)
  else
    puts "Overall, we have #{names.count} student".center(100)
    puts "--------------------------".center(100)
  end
end

def interactive_menu
  puts "Type in the numbers below to select what you want to do.".center(100)
  loop do
  # Show user list options
    selection = print_menu
  # Do what the user has asked
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "9"
        exit
      else
        puts "I dont know what you mean, try again".center(100)
    end
  # Repeat from step 1
  end
end

def print_menu
    puts "1. Inputs the students".center(100)
    puts "2. Show the students".center(100)
    puts "9. Exit".center(100)
    selection = gets.chomp
    return selection
end

def show_students
  print_header
  print(@students)
  print_footer(@students)
end

interactive_menu