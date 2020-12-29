# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:survey).class_name('Survey') }
    it { is_expected.to have_many(:answers).class_name('Answer') }
  end

  describe 'validations' do
    it { is_expected.to accept_nested_attributes_for(:answers) }
  end

  context 'when there is less than two answers' do
    it "validates that there is at least two answers" do
      subject.validate
      expect(subject.errors[:answers]).to include('At least two answers must exist')
    end
  end

  context 'when there is more than one correct answer' do
    it 'validates that there is only one correct answer' do
      subject.validate
      expect(subject.errors[:answers]).to include('There must be one correct answer to each question')
    end
  end
end
