class AddCapacityToTalks < ActiveRecord::Migration
  def up
    add_column :talks, :capacity, :integer
  end

  def down
    remove_column :talks, :capacity, :integer
  end
end
