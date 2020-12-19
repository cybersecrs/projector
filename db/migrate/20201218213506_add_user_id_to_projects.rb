class AddUserIdToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :user_id, :integer, foreign_key: true
  end
end
