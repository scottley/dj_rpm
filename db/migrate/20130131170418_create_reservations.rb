class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.string :name
      t.boolean :email_sent

      t.timestamps
    end
  end
end
