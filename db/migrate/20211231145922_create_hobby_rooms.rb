class CreateHobbyRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :hobby_rooms do |t|
      t.string :genre
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
