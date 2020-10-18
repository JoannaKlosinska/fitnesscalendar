class AddKindToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :type, :string, default: 'Customer'
  end
end
