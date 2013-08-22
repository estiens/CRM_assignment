require "./contact.rb"

class Database
	attr_accessor :contacts_array

	def initialize
		@contacts_array = Array.new
	end

	def add_a_contact
		puts "Great, let's add a contact. What's the first name of your contact?"
		firstname=gets.chomp
		puts "And the last name?"
		lastname=gets.chomp
		puts "Email?"
		email=gets.chomp
		puts "Lastly, do you have a note for the contact?"
		note=gets.chomp
		contact=Contact.new(firstname,lastname,email,note)
		@contacts_array << contact
		puts "I added #{firstname} #{lastname} to the database"
		puts"\n"
	end

	def display_all_contacts
		check_database
		@contacts_array.each do |contact|
			contact.display_single_contact
		end
	end

  def select_a_contact
	check_database
  	if ! @contacts_array.empty?
  	puts "Please enter a name, id number, or email address"
  	attribute=gets.chomp
  	@contacts_array.each do |contact|
			if (contact.id.to_s == attribute) || (contact.firstname.downcase == attribute.downcase) || (contact.lastname.downcase == attribute.downcase) || (contact.email.downcase == attribute.downcase)
				contact.display_single_contact
			end
		end
	end
  end


  def delete_a_contact
  	check_database
  	if ! @contacts_array.empty?
  	puts "Please enter a name, id number, or email address"
  	attribute=gets.chomp	
  		@contacts_array.each do |contact|
			
			if (contact.id.to_s == attribute) || (contact.firstname.downcase == attribute.downcase) || (contact.lastname.downcase == attribute.downcase) || (contact.email.downcase == attribute.downcase)
				puts "Are you sure you want to delete #{contact.firstname} #{contact.lastname}? Y/N"
				print">>"
					answer=gets.chomp
					if answer=="Y"
						@contacts_array.delete(contact)
					elsif answer =="N"
						puts "okay I won't delete it"
						return false
					else
						puts "Please put Y or N"
					end
			else
				puts "Sorry, I couldn't find any contact with the attribute: #{attribute}"
				return false
			end
		end
	end	
  end


def modify_a_contact
  check_database
  if ! @contacts_array.empty?
  	puts "Please enter a name, id number, or email address"
  	attribute=gets.chomp
  	
  	@contacts_array.each do |contact|
		if (contact.id.to_s == attribute) || (contact.firstname.downcase == attribute.downcase) || (contact.lastname.downcase == attribute.downcase) || (contact.email.downcase == attribute.downcase)
				puts "Modifying the following contact"
				contact.display_single_contact
				puts "Is that what you want? Y/N"
				print ">> "
				confirmation = gets.chomp.downcase
					if confirmation == "y"
						puts "What attribute would you like to modify? [F]irst Name, [L]ast Name, [E]mail, or [N]ote?"
						attrchoice=gets.chomp.downcase
							case attrchoice
							when "f"
								puts "What's the new first name?"
								firstname=gets.chomp
								contact.firstname=firstname
							when "l"
								puts "What's the new last name?"
								lastname=gets.chomp
								contact.lastname=lastname							
							when "e"
								puts "What's the new email?"
								email=gets.chomp
								contact.email=email
							when "n"
								puts "What's the new note?"
								note=gets.chomp
								contact.note=note
							else "Sorry, that's not a valid choice."
							end
					elsif confirmation == "n"
						puts "okay, returning to main menu"
					else 
						puts "please say Y or N"
					end
		end			
		end
  end
end

def check_database
  	puts "Sorry, nothing in the database yet\n\n" if @contacts_array.empty?
end

end