require 'rails_helper'

RSpec.describe Question, :type => :model do

  describe 'associations' do
    it { should  belong_to(:survey).class_name('Survey') }
    it { should  have_many(:answers).class_name('Answer') }
  end

end