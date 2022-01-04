class CreateGroupChats < ActiveRecord::Migration[6.0]
  def change
    create_table :group_chats do |t|
      t.references :hobby_room, null: false, foreign_key: true
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
