require 'rails_helper'

RSpec.describe User, :type => :model do
  describe 'validations' do
    it { should validate_presence_of(:nickname) }
    it { should validate_uniqueness_of(:nickname).ignoring_case_sensitivity }
  end

  describe 'associations' do
    it { should  have_many(:survey_users).class_name('SurveyUser') }
    it { should  have_many(:surveys).with_foreign_key('survey_id') }
  end

end