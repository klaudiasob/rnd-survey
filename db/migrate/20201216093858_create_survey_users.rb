# frozen_string_literal: true

class CreateSurveyUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys_users do |t|
      t.references :survey, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
