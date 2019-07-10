class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :usefulness
      t.integer :agenda_met
      t.integer :on_topic
      t.string :improvements
      t.string :other_comments
      t.references :meeting, null: false, foreign_key: true

      t.timestamps
    end
  end
end
