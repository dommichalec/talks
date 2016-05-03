class AddSpeakerProfileToTalks < ActiveRecord::Migration
  def up
    add_column :talks, :speaker_profile, :text
  end

  def down
    remove_column :talks, :speaker_profile, :text
  end
end
