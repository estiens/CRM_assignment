#requires

require 'colorize'

#database class

class Database
	def initialize
		@contacts_arr=[]
	end

def add_contact(contact)
	@contacts_arr<<contact
end

end

class Contact
  @@contact_index = 1000

  attr_accessor :id, :firstname, :lastname, :email, :note

  def initialize(first_name, last_name, email, note)
    @id=@@contact_index
    @firstname = firstname
    @lastname = lastname
    @email = email
    @note = note
    @@contact_index +=1
  end

  def display_single_contact
		puts "ID: #{@id}"
		puts "First Name: #{@firstname}"
		puts "Last Name: #{@lastname}"
		puts "Email Address: #{@email}"
		puts "Notes: #{@notes}"
  end

  def display_all_contacts
  end

  def select_a_contact
  end

  def delete_a_contact
  end

  def modify_a_contact
  end

end


#main menu

def print_main_menu
 
  puts "[1] Add a new contact".red
  puts "[2] Modify an existing contact".red
  puts "[3] Delete a contact".red
  puts "[4] Display all the contacts".red
  puts "[5] Display an attribute".red
  puts "[6] Exit".red
  puts
  print "Enter a number: ".black
end

def main_menu
  print_main_menu
  @user_selected = gets.to_i
end

def add_contact
	puts "Great, let's add a contact. What's the first name of your contact?"
	firstname=gets.chomp
	puts "And the last name?"
	lastname=gets.chomp
	puts "Email?"
	email=gets.chomp
	puts "Lastly, do you have a note for the contact?"
	note=gets.chomp
	contact=Contact.new(firstname,lastname,email,note)
	db.add(contact)
	puts contact
	puts "I added #{firstname} #{lastname} to the database"
	puts"\n"
end

def display_contacts
	Contact.display
end

def do_the_things
	case @user_selected
		when 1
			add_contact
		when 2
			puts "You chose 2!"
		when 3
			puts "You chose 3!"
		when 4
			display_contacts
		when 5
			puts "You chose 5!"
		when 6 
			puts "Bye now!"
			exit
		else 
			puts "Sorry, not a valid choice!\nPlease choose again.\n\n"
		end 
	main_loop
end

def main_loop
	main_menu	
	do_the_things
end

puts "\e[H\e[2J"
db=Database.new
main_loop


