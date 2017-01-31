class AddForeignkeyToGroupUsers < ActiveRecord::Migration[5.0]
  def change
    add_foreign_key :group_users, :groups
    add_foreign_key :group_users, :users
  end
end
