# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Survey, type: :model do
  describe 'associations' do
    it { is_expected.to  belong_to(:admin).class_name('Admin') }
    it { is_expected.to  have_many(:questions).class_name('Question') }
    it { is_expected.to  have_many(:survey_users).class_name('SurveyUser') }
    it { is_expected.to  have_many(:users).with_foreign_key('user_id') }
  end
end
