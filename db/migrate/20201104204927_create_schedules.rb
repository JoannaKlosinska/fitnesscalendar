class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :coach, foreign_key: { to_table: :users }, null: false
      t.string :monday, array: true, default: [], null: false
      t.string :tuesday, array: true, default: [], null: false
      t.string :wednesday, array: true, default: [], null: false
      t.string :thursday, array: true, default: [], null: false
      t.string :friday, array: true, default: [], null: false
      t.string :saturday, array: true, default: [], null: false
      t.string :sunday, array: true, default: [], null: false

      t.timestamps null: false
    end
  end
end
