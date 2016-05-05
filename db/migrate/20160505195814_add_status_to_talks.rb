class AddStatusToTalks < ActiveRecord::Migration
  def change
    add_column :talks, :status, :string, default: "upcoming"
  end
end
