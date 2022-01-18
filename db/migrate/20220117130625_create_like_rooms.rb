class CreateLikeRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :like_rooms do |t|
      t.references :user, null: false, foreign_key: true
      t.references :hobby_room, null: false, foreign_key: true

      t.timestamps
    end
  end
end