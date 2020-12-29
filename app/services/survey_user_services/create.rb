# frozen_string_literal: true

module SurveyUserServices
  class Create
    attr_reader :survey_user, :params, :user_nickname

    def initialize(survey_user:, params:, user_nickname:)
      @survey_user = survey_user
      @params = params
      @user_nickname = user_nickname
    end

    def call
      survey_user.assign_attributes(params.merge(user: find_or_create_user))
      result = survey_user.save
      survey_user.user = nil unless result
      result
    end

    private

    def find_or_create_user
      return if user_nickname.blank?

      User.find_or_create_by(nickname: user_nickname)
    end
  end
end
