class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :user_name
      t.string :email
      t.boolean :moderator
      t.string :password

      t.timestamps
    end
  end
end
