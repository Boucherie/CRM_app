require_relative 'contact.rb'

class CRM

  # def initialize(name)
  #   @name = name
  # end

  def main_menu
    while true # repeat indefinitely
      print_main_menu
      user_selected = gets.to_i
      call_option(user_selected)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected) #get this to work?
    case user_selected
      when 1 then add_new_contact
      when 2 then modify_existing_contact
      when 3 then delete_contact
      when 4 then display_all_contacts
      when 5 then search_by_attribute
      when 6 then exit(true)
    end
  end

  def add_new_contact
    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    new_contact = Contact.create(
      first_name: first_name,
      last_name: last_name,
      email: email,
      note: note
    )
    # new_contact =
    # Contact.create(first_name, last_name, email, note)
    print = "new_contact"
  end

  def modify_existing_contact
    puts "Enter the first name of the contact you want to change: "
    value_find = gets.chomp

    update(first_name: value_find)
    Contact.find_by(first_name: value_find)

    puts "Enter the attribute you want to modify: "
    attribute = gets.chomp

    puts "Enter the new value for that contact: "
    value = gets.chomp
    modified_value.update(attribute => value)

    #.update(attribute, value)
  end

  def delete_contact # these need a few if statements
    puts "Enter the first name of the contact you want to delete: "
    value_find = gets.chomp
    removed_contact = Contact.find_by(first_name: value_find)
    puts "Contact deleted: "
    print removed_contact.delete
  end

  def display_all_contacts
    full_list = Contact.all
    print "#{full_list}"
  end

  def search_by_attribute
    print "Which attribute do you want to search by: "
    attribute = gets.chomp
    print "Enter a value: "
    value = gets.chomp
    attribute_searched = Contact.find_by(attribute => value)
    print "#{value}"
  end
end

#
# crm_app = CRM.new("CRM app")
# crm_app.main_menu

at_exit do
  ActiveRecord::Base.connection.close
end
