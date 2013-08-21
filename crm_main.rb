#requires

require 'colorize'
require './db.rb'
require './contact.rb'

#main menu

def print_main_menu
  puts "[1] Add a new contact".red
  puts "[2] Modify an existing contact".red
  puts "[3] Delete a contact".red
  puts "[4] Display all the contacts".red
  puts "[5] Search for contacts by attribute".red
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
	@db.add_a_contact(contact)
	puts "I added #{firstname} #{lastname} to the database"
	puts"\n"
end


def do_the_things
	case @user_selected
		when 1
			add_contact
		when 2
			@db.modify_a_contact
		when 3
			@db.delete_a_contact
		when 4
			@db.display_all_contacts
		when 5
			@db.select_a_contact
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
@db=Database.new
main_loop


