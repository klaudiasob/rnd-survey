require 'rails_helper'

RSpec.describe Answer, :type => :model do
  describe 'validations' do
    it { should validate_presence_of(:body) }
  end

  describe 'associations' do
    it { should  belong_to(:question).class_name('Question') }
    it { should  have_many(:answer_survey_users).class_name('AnswerSurveyUser') }
    it { should  have_many(:survey_users).with_foreign_key('survey_user_id') }
  end

end