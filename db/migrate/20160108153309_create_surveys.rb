class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.integer :user_id, null: false, index: true

      t.timestamps null: false
    end
  end
end
