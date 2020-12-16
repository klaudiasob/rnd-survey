# frozen_string_literal: true

class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.string :name
      t.references :admin
      t.timestamps
    end
  end
end
