class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.boolean :agenda
      t.integer :agenda_met
      t.integer :appropriate_meeting_time
      t.integer :appropriate_meeting_length
      t.integer :started_on_time
      t.integer :ended_on_time
      t.boolean :action_items
      t.integer :on_topic
      t.integer :usefulness
      t.integer :necessary_to_attend
      t.integer :ability_to_contribute
      t.string :improvements
      t.string :other_comments
      t.references :meeting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
