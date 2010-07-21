Factory.define :message, :class => Contact do |m|
  m.first_name 'Jane'
  m.last_name  'Doe'
  m.email 'jane@example.com'
  m.message 'This is a test email message.'
end
