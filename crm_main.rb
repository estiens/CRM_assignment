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

#user chooser

def do_the_things
	case @user_selected
		when 1
			@db.add_a_contact
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


