# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :survey
  has_many :answers
  has_many :answer_survey_users

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  validate :at_least_two_answers

  private

  def at_least_two_answers
    return if answers.size >= 2

    errors.add(:answers, 'Pytanie musi zawierać minimum dwie odpowiedzi')
  end
end
