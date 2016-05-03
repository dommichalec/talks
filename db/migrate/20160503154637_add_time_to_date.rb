class AddTimeToDate < ActiveRecord::Migration
  def change
    change_column :talks, :date, :datetime
  end
end
