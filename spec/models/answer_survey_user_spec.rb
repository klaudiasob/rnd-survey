# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AnswerSurveyUser, type: :model do
  describe 'associations' do
    it { is_expected.to  belong_to(:survey_user).class_name('SurveyUser') }
    it { is_expected.to  belong_to(:answer).class_name('Answer') }
  end
end
