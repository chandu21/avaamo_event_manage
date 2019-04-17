require 'csv'

namespace :manage_users do
  desc "create all users"
  task create: :environment do
    create_users
    puts "Events created successfully" 
  end



  def create_events
    csv = CSV.parse(open(Rails.root.join('app/event_data', 'users.csv')), headers: true)
    headers = csv.headers
    records = csv.map
    records.with_index(2) do |row, row_number|
      user = User.new(username: row['username'], email: row['email'], phone: row['phone'])
      user.save
    end
  end  
end