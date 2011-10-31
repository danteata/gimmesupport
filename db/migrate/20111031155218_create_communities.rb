class CreateCommunities < ActiveRecord::Migration
  def change
    create_table :communities do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
end
