# frozen_string_literal: true

class CreateAnswerSurveyUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers_surveys_users do |t|
      t.integer :survey_user_id, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
    end
  end
end
