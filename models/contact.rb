# The contact model is meant to store information on a contact for an SOSMS user.
# It accepts information for a users contacts such as email and phone number. In
# the event of a disaster or emergency a user might have one or more contacts that
# need to be notified when they check in.

# The Flag uses an Integer to create a property which can take one of a number
# of symbolic values. This controls how we contact a user if the event that a
# user checks in. Flag is similar to Enum but can hold an array of values.

# Examples:
#
# c = Contact.new
# c.contact_method
# => :none
#
# c.contact_method = [ :sms, :email ] # this would text and email a contact

class Contact
  include DataMapper::Resource

  property :id,             Serial
  property :first_name,     String
  property :last_name,      String
  property :email,          String
  property :phone_number,   Integer
  property :contact_method, Flag[ :email, :call, :sms, :none, :all ], :default => [ :none ]
  property :created_at,     DateTime, :lazy => true
  property :updated_at,     DateTime, :lazy => true
end
