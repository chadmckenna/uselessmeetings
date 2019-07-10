class CreateMeetings < ActiveRecord::Migration[6.0]
  def change
    create_table :meetings do |t|
      t.string :title
      t.string :share_slug, null: false, index: true
      t.string :review_slug, null: false, index: true

      t.timestamps
    end
  end
end
