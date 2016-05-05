class AddQuestionToRegistrations < ActiveRecord::Migration
  def change
    add_column :registrations, :question, :string
  end
end
