# frozen_string_literal: true

class Answer < ApplicationRecord
  validates :body, presence: true
  belongs_to :question
  has_many :answer_survey_users
  has_many :survey_users, through: :answer_survey_users
end
