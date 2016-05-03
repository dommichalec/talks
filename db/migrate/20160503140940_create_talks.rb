class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.string :title
      t.string :speaker
      t.string :topic
      t.date :date

      t.timestamps null: false
    end
  end
end
