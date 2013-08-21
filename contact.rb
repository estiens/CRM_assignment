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
		puts "\nID:\t\t#{@id}"
		puts "First Name:\t#{@firstname}"
		puts "Last Name:\t#{@lastname}"
		puts "Email Address:\t#{@email}"
		puts "Notes:\t\t#{@note}\n"
  end

  

end