# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, type: :model do
  describe 'associations' do
    it { is_expected.to  belong_to(:survey).class_name('Survey') }
    it { is_expected.to  have_many(:answers).class_name('Answer') }
  end

  describe 'validations' do
    it { is_expected.to accept_nested_attributes_for(:answers) }
  end

  context 'when there is less than two answers' do
    it "validates that there is at least two answers" do
      subject.validate
      expect(subject.errors[:answers]).to include('Pytanie musi zawierać minimum dwie odpowiedzi')
    end
  end
end
