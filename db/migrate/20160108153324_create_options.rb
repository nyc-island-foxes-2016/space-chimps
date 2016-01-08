class CreateOptions < ActiveRecord::Migration
  def change
    create_table do |t|
      t.string :content, null: false
      t.integer :question_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
