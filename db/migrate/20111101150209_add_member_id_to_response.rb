class AddMemberIdToResponse < ActiveRecord::Migration
  def change
    add_column :responses, :member_id, :integer
  end
end
