class ChangColumnToGroupUser < ActiveRecord::Migration[5.0]
  def change
    change_column :group_users, :group_id, :integer, null: false
  end
end
