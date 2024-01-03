class Person
  attr_accessor :name, :address, :phone_number, :email

  def initialize(name, address, phone_number, email)
    @name = name
    @address = address
    @phone_number = phone_number
    @email = email
  end
end
