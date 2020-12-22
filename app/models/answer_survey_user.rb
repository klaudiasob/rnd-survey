# frozen_string_literal: true

class AnswerSurveyUser < ApplicationRecord
  self.table_name = 'answers_surveys_users'
  belongs_to :survey_user
  belongs_to :answer
  belongs_to :question
end
