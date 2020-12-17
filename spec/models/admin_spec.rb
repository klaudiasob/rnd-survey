require 'rails_helper'

RSpec.describe Admin, :type => :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_confirmation_of(:password) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end

  describe 'associations' do
    it { should  have_many(:surveys).class_name('Survey') }
  end

end