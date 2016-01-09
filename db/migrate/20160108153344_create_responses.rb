class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :option_id, null: false, index: true
      t.integer :question_id, null: false, index: true
      t.integer :surveys_user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
