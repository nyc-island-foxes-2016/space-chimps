class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :content, null: false
      t.integer :survey_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
