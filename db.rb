require "./contact.rb"

class Database
	attr_accessor :contacts_array

	def initialize
		@contacts_array = Array.new
		puts "sanity check: database initialized".yellow
	end

	def add_a_contact(contact)
		@contacts_array << contact
	end

	def display_all_contacts
		puts "Sorry, nothing in the database yet\n" if @contacts_array.empty?
		@contacts_array.each do |contact|
			contact.display_single_contact
		end
	end

  def select_a_contact
  end

  def delete_a_contact
  end

  def modify_a_contact
  end

end