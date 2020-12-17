# frozen_string_literal: true

class User < ApplicationRecord
  validates :nickname, presence: true, uniqueness: true
  has_many :survey_users
  has_many :surveys, through: :survey_users
end
