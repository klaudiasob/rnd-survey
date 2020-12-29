# frozen_string_literal: true

module SurveyUserServices
  class Build
    attr_reader :survey_id

    def initialize(survey_id:)
      @survey_id = survey_id
    end

    def call
      survey_user = SurveyUser.new(survey_id: survey_id)
      build_question_placeholders(survey_user)
      survey_user
    end

    private

    def build_question_placeholders(survey_user)
      survey_user.survey.questions.each do |question|
        survey_user.answer_survey_users.build(question_id: question.id)
      end
    end
  end
end
