# frozen_string_literal: true

class SurveyUsersController < ApplicationController
  def index
    @survey_users = SurveyUser.all
  end

  def index_survey
    @survey_users = SurveyUser.where(survey_id: params[:survey_id])
  end

  def new
    @survey_user = SurveyUser.new(survey_id: params[:survey_id])
    @survey_user.survey.questions.each do |question|
      @survey_user.answer_survey_users.build(question_id: question.id)
    end
  end

  def create
    @survey_user = SurveyUser.new(survey_user_params)
    @survey_user.user = User.find_by(nickname: params[:survey_user][:user])
    if @survey_user.save
      redirect_to survey_user_path(id: @survey_user), notice: 'Thanks for the answers!'
    else
      render :new
    end
  end

  def show
    @survey_user = SurveyUser.find(params[:id])
  end

  private

  def survey_user_params
    params.require(:survey_user).permit(:user_id, :survey_id, answer_survey_users_attributes: %i[survey_user_id answer_id question_id])
  end
end
