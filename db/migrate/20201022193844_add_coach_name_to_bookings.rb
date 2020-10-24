class AddCoachNameToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :coach_name, :string
  end
end
