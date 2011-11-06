class FixResponseColumName < ActiveRecord::Migration
  def change
    rename_column :responses, :question_id, :respondable_id
  end

end
