class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :community_id
      t.integer :member_id
      t.text :content
      t.string :title
      t.string :status

      t.timestamps
    end
  end
end
