class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :phone
      t.string :rsvp
      t.string :allday
      t.string :extrcol

      t.timestamps
    end
  end
end
