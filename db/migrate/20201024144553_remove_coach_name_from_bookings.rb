class RemoveCoachNameFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :coach_name, :string
  end
end
