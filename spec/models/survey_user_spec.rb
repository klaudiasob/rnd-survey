require 'rails_helper'

RSpec.describe SurveyUser, :type => :model do

  describe 'associations' do
    it { should  belong_to(:survey).class_name('Survey') }
    it { should  belong_to(:user).class_name('User') }
    it { should  have_many(:answer_survey_users).class_name('AnswerSurveyUser') }
    it { should  have_many(:answers).with_foreign_key('answer_id') }
  end

end