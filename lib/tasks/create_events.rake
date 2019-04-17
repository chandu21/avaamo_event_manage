require 'csv'

namespace :manage_events do
  desc "create all events"
  task create: :environment do
    create_events
    puts "Events created successfully" 
  end



  def create_events
    csv = CSV.parse(open(Rails.root.join('app/event_data', 'events.csv')), headers: true)
    headers = csv.headers
    records = csv.map
    records.with_index(2) do |row, row_number|
      users = []
      rvsp = row['users#rsvp']&.split('#')
      allday = row['allday']&.split('#')
      extracol = row['extracol']&.split('#')
      event = Event.new(title: row['title'], start_time: row['starttime'], end_time: row['endtime'],
        description: row['description'], rsvp: rvsp&.last, allday: allday&.last, extracol: extracol&.last)
      users << rvsp&.first
      users << allday&.first
      users << extracol&.first
      user_ids = User.where(username: users).pluck(:id)
      event.save
      event.user_ids += user_ids
    end
  end  
end