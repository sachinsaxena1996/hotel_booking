class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :number
      t.string :room_type
      t.string :specification
      t.float :charges
      t.string :status

      t.timestamps
    end
  end
end
