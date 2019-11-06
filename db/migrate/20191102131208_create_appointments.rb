class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :name
      t.integer :user_id
      t.date :date
      t.timestamps
    end

  end
end
