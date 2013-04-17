class CreateVoiceResponses < ActiveRecord::Migration
  def change
    create_table :voice_responses do |t|
      t.integer :suggestion_id
      t.integer :manager_id

      t.timestamps
    end
  end
end
