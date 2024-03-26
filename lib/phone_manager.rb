require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_phone_number(phone)
  if phone.to_s.gsub(/\D/, '').length == 10 
    phone.to_s.gsub(/\D/, '')
  elsif phone.to_s.gsub(/\D/, '').length == 11 && phone.to_s.gsub(/\D/, '')[0] == 1
    phone.to_s.gsub(/\D/, '')[1..10]
  end
end

contents = CSV.open(
  'event_attendees.csv',
  headers: true,
  header_converters: :symbol
)

contents.each do |row|
  name = row[:first_name]
  phone = clean_phone_number(row[:homephone])

  puts "#{name} #{phone}"
end