require 'rails_helper'

RSpec.describe AnswerSurveyUser, :type => :model do

  describe 'associations' do
    it { should  belong_to(:survey_user).class_name('SurveyUser') }
    it { should  belong_to(:answer).class_name('Answer') }
  end

end