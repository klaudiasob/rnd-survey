# frozen_string_literal: true

class SurveyUser < ApplicationRecord
  self.table_name = 'surveys_users'
  belongs_to :survey
  belongs_to :user
  has_many :answer_survey_users
  has_many :answers, through: :answer_survey_users
  paginates_per 5

  accepts_nested_attributes_for :answer_survey_users, reject_if: :all_blank, allow_destroy: true

  scope :newest_first, -> { order(created_at: :desc) }
end
