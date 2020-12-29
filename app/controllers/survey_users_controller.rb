# frozen_string_literal: true

class SurveyUsersController < ApplicationController
  before_action :authenticate_admin!, only: %i[index index_survey]

  def index
    @survey_users = SurveyUser.newest_first.page(params[:page])
  end

  def index_survey
    @survey_users = SurveyUser.newest_first.where(survey_id: params[:survey_id]).page(params[:page])
  end

  def new
    @survey_user = SurveyUserServices::Build.new(survey_id: params[:survey_id]).call
  end

  def create
    @survey_user = SurveyUser.new
    result = SurveyUserServices::Create.new(survey_user: @survey_user, params: survey_user_params,
                                            user_nickname: params[:survey_user][:user]).call
    if result
      redirect_to survey_user_path(id: @survey_user)
    else
      render :new
    end
  end

  def show
    @survey_user = SurveyUser.find(params[:id])
  end

  private

  def survey_user_params
    params.require(:survey_user).permit(:survey_id, answer_survey_users_attributes: %i[survey_user_id answer_id question_id])
  end
end
