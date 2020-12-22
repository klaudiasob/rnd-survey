# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:nickname) }
    it { is_expected.to validate_uniqueness_of(:nickname).ignoring_case_sensitivity }
  end

  describe 'associations' do
    it { is_expected.to  have_many(:survey_users).class_name('SurveyUser') }
    it { is_expected.to  have_many(:surveys).with_foreign_key('survey_id') }
  end
end
