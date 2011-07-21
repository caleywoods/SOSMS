Factory.define :user do |u|
  u.sequence(:email) { |n| "test#{n}@example.com" }
  u.password "seekrit"
end

Factory.define :contact do |c|
  c.first_name "John"
  c.last_name "Doe"
  c.sequence(:email) { |n| "test#{n}@example.com" }
  c.phone_number "6601234567"
end
