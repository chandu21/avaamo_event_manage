class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.string :description
      t.string :rsvp
      t.string :allday
      t.string :extrcol

      t.timestamps
    end
  end
end
