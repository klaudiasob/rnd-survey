# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SurveyUser, type: :model do
  describe 'associations' do
    it { is_expected.to  belong_to(:survey).class_name('Survey') }
    it { is_expected.to  belong_to(:user).class_name('User') }
    it { is_expected.to  have_many(:answer_survey_users).class_name('AnswerSurveyUser') }
    it { is_expected.to  have_many(:answers).with_foreign_key('answer_id') }
  end
end
