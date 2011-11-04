class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.integer :member_id
      t.integer :rep_id
      t.text :message
      t.integer :community_id

      t.timestamps
    end
    add_index :chats, :member_id
    add_index :chats, :rep_id

  end
end
