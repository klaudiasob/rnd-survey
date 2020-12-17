require 'rails_helper'

RSpec.describe Survey, :type => :model do

  describe 'associations' do
    it { should  belong_to(:admin).class_name('Admin') }
    it { should  have_many(:questions).class_name('Question') }
    it { should  have_many(:survey_users).class_name('SurveyUser') }
    it { should  have_many(:users).with_foreign_key('user_id') }
  end

end