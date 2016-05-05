class MakeRegistrationsAJoinTable < ActiveRecord::Migration
  def up
    Registration.delete_all
    remove_column :registrations, :first_name
    remove_column :registrations, :last_name
    remove_column :registrations, :email_address
    add_column :registrations, :user_id, :integer
  end

  def down
    Registration.delete_all
    remove_column :registrations, :user_id, :integer
    add_column :registrations, :first_name
    add_column :registrations, :last_name
    add_column :registrations, :email_address
  end
end
