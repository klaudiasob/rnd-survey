class AddTimestampsToSurveysUsers < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :surveys_users, null: true
  end
end

