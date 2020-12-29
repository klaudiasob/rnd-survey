# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :survey
  has_many :answers
  has_many :answer_survey_users

  accepts_nested_attributes_for :answers, reject_if: :all_blank, allow_destroy: true
  validate :at_least_two_answers
  validate :only_one_correct_answer

  private

  def at_least_two_answers
    return if answers.size >= 2

    errors.add(:answers, 'At least two answers must exist')
  end

  def only_one_correct_answer
    return if answers.select(&:correct?).size == 1

    errors.add(:answers, 'There must be one correct answer to each question')
  end
end
