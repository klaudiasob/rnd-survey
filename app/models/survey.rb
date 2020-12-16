# frozen_string_literal: true

class Survey < ApplicationRecord
  belongs_to :admin
  has_many :questions
  has_many :survey_users
  has_many :users, through: :survey_users
end
