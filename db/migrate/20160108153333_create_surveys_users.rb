class CreateSurveysUsers < ActiveRecord::Migration
  def change
    create_table :surveys_users do |t|
       t.integer :user_id, null: false, index: true
       t.integer :survey_id, null: false, index: true

       t.timestamps null: false
    end
  end
end
