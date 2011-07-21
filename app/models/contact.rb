class Contact < ActiveRecord::Base
  # Using has_many instead of has_one because people
  # might share a contact.
  #
  # Scenario: We have three friends Bill, Bob, and Rob.
  # Bill and Bob could both signup for SOSMS and use
  # Rob as a contact. Rob would then have more than one
  # user associated with his Contact "account"
  has_many :users

  def to_param
    "#{id}-#{first_name}-#{last_name}"
  end
end
