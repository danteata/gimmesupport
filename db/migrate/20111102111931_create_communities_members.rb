class CreateCommunitiesMembers < ActiveRecord::Migration
  def up
    create_table 'communities_members' do |t|
      t.integer :community_id
      t.integer :member_id
    end
  end

  def down
    drop_table 'communities_members'
  end
end
