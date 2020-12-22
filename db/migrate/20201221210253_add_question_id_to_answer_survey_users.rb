class AddQuestionIdToAnswerSurveyUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers_surveys_users, :question_id, :bigint
  end
end
