class CreateHobbyRoomUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :hobby_room_users do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hobby_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
