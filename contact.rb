class Contact
  @@contact_index = 1000

  attr_accessor :id, :firstname, :lastname, :email, :note

  def initialize(firstname, lastname, email, note)
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
		puts "Notes: #{@note}"
  end

  

end