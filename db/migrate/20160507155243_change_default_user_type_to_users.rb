class ChangeDefaultUserTypeToUsers < ActiveRecord::Migration
  def change
    change_column :users, :user_type, :string, default: "new user"
  end
end
