class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.datetime :time, null: false

      t.timestamps
    end
  end
end
