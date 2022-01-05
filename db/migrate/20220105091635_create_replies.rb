class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.text :content
      t.string :name
      t.references :group_chat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
