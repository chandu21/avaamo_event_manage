class Event < ApplicationRecord
  has_and_belongs_to_many :users

  scope :having_event_between, -> (start_date, end_date) { where('start_time >= ? and end_time <= ?', start_date, end_date) }
end
