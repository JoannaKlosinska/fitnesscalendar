class AddCustomerIdToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :customer_id, :integer
  end
end
