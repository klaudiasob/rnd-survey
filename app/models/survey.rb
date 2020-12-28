# frozen_string_literal: true

class Survey < ApplicationRecord
  belongs_to :admin
  has_many :questions, inverse_of: :survey
  has_many :survey_users
  has_many :users, through: :survey_users

  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true
  validate :at_least_one_question

  private

  def at_least_one_question
    return if questions.size >= 1

    errors.add(:questions, 'Ankieta musi zawierać conajmniej jedno pytanie')
  end
end
