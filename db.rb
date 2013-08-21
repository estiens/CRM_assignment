#database class

class Database
	attr_accessor :contacts_array

	def initialize
		@contacts_array = Array.new
	end

	def add(contact)
		@contacts_array << contact
	end

  def select_a_contact
  end

  def delete_a_contact
  end

  def modify_a_contact
  end

end