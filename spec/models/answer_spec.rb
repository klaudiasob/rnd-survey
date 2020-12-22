# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:body) }
  end

  describe 'associations' do
    it { is_expected.to  belong_to(:question).class_name('Question') }
    it { is_expected.to  have_many(:answer_survey_users).class_name('AnswerSurveyUser') }
    it { is_expected.to  have_many(:survey_users).with_foreign_key('survey_user_id') }
  end
end
