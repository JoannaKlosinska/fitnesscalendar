class AddCoachIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :coach_id, :integer
  end
end
