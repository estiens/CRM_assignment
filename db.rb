require "./contact.rb"

class Database
	attr_accessor :contacts_array

	def initialize
		@contacts_array = Array.new
	end

	def add_a_contact(contact)
		@contacts_array << contact
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
			end
		end
  	end
  end

  def check_database
  	puts "Sorry, nothing in the database yet\n\n" if @contacts_array.empty?

  end

end