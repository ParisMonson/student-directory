@students = []

def input_students
  puts "Please enter the name of the student"
  name = STDIN.gets.chomp
  puts "Please enter their cohort:"
  cohort = STDIN.gets.chomp
  while !name.empty? do
    
    @students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{@students.count} students"
    puts "Please enter the name of the student or press Enter to finish."
    name = STDIN.gets.chomp
    unless name.empty?
      puts "Please enter their cohort:"
      cohort = STDIN.gets.chomp
      cohort == "" ? cohort = "Unknown" : nil
    end
  end
end

def print_header
  puts "The students of Villain Academy".center(100)
  puts "--------------------------".center(100)
end

def print_students_list
  names_printed = 0
  cohort_list = check_cohort_exists
  cohort_list.each do |cohort|
    @students.each do |hash|
      hash.each do |k, v|
        if k == :cohort && v == cohort
          puts "#{names_printed + 1}. #{hash[:name]} (#{hash[:cohort]})".center(100)
          names_printed += 1
        end
    end
  end
  end
end

def print_footer
  unless @students.length <= 1
    puts "Overall, we have #{@students.count} great students".center(100)
    puts "--------------------------".center(100)
  else
    puts "Overall, we have #{@students.count} student".center(100)
    puts "--------------------------".center(100)
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
    puts "Type in the numbers below to select what you want to do.".center(100)
    puts "1. Inputs the students".center(100)
    puts "2. Show the students".center(100)
    puts "3. Save student list to file".center(100)
    puts "9. Exit".center(100)
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
      puts "Students Saved."
    when "9"
      exit
    else
      puts "I dont know what you mean, try again".center(100)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    output = [student[:name], student[:cohort]]
    file.puts(output.join(","))
  end
  file.close 
end

def load_students(filename= "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return load_students if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def check_cohort_exists
  cohort_list = []
  for i in @students do
    i.each { |k, v|
      k == :cohort && !cohort_list.include?(v) ? cohort_list << v : nil
    }
  end
  cohort_list
end
try_load_students
interactive_menu