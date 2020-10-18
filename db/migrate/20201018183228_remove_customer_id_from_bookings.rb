class RemoveCustomerIdFromBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :customer_id, :integer
  end
end
