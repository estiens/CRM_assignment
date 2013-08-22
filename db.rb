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
  return if @contacts_array.empty?
  puts "Please enter a name, id number, or email address"
  attribute=gets.chomp
  filtered = filtered_contacts(attribute)
    if filtered.length == 0
      puts "Sorry, I couldn't find any contact with the attribute: #{attribute}"
      return false
    end
    puts "Here are the contacts that match #{attribute}"
    filtered.each do |contact|
      contact.display_single_contact
    end
  end


  def delete_a_contact
  	check_database
  	return if @contacts_array.empty?
    puts "Please enter a name, id number, or email address"
    attribute=gets.chomp
    filtered = filtered_contacts(attribute)

    if filtered.length == 0
      puts "Sorry, I couldn't find any contact with the attribute: #{attribute}"
      return false
    end

  	filtered.each do |contact|
			puts "You are about to delete #{contact.firstname} #{contact.lastname}."
			unless prompt_for_confirmation
				puts "Ok, I won't do that"
				next
      end
      @contacts_array.delete(contact)
		end
	end	
  


  def filtered_contacts(attribute)
    @contacts_array.select do |c|
      [:firstname, :lastname, :email].inject(c.id.to_s == attribute) do |previous, key|
        previous || c.send(key).downcase == attribute.to_s.downcase
      end
    end
  end

  def prompt_for_confirmation
      puts "Is that what you want? Y/N"
      print ">> "
      confirmation = gets.chomp.downcase
      return true if confirmation == "y"
      return false if confirmation == "n"
  end

def modify_a_contact
  check_database
  return if @contacts_array.empty?
	puts "Please enter a name, id number, or email address"
	attribute=gets.chomp

	filtered_contacts(attribute).each do |contact|
		puts "Modifying the following contact"
		contact.display_single_contact
    unless prompt_for_confirmation
      puts "okay, returning to main menu"
      next
    end
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
    else
      "Sorry, that's not a valid choice."
    end
  end
end

def check_database
  	puts "Sorry, nothing in the database yet\n\n" if @contacts_array.empty?
end

end