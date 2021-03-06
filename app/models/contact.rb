class Contact < ActiveRecord::Base
  # Using has_many instead of has_one because people
  # might share a contact.
  #
  # Scenario: We have three friends Bill, Bob, and Rob.
  # Bill and Bob could both signup for SOSMS and use
  # Rob as a contact. Rob would then have more than one
  # user associated with his Contact "account"
  has_many :users

  attr_accessible :first_name, :last_name, :email, :phone_number, :voice, :sms, :user_id

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def text(message)
    Twilio.connect(config['TWILIO_SID'], config['TWILIO_TKN'])
    Twilio::Sms.message('4172082640', self.phone_number, message)
  end

  #def call
    #Twilio::Call.make('4172082640', self.phone_number, 'http://582dc2b5.dotcloud.com/incoming/call')
  #end

  def notify
   # if voice?
      #call
    if sms?
      text("#{overlord} has checked in with SOSMS. Despite disaster they're safe.")
    end
  end

  def overlord
    User.find(self.user_id).email
  end

  def to_param
    "#{id}-#{first_name}-#{last_name}"
  end
end
