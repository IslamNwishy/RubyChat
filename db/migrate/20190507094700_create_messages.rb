class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    drop_table :messages
    create_table :messages do |t|
      t.text "body"
      t.integer "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "chat_room_id"
      t.index ["user_id"], name: "index_messages_on_user_id"
    end
  end
end
