# frozen_string_literal: true

class SurveysController < ApplicationController
  before_action :set_survey, only: %i[show edit update destroy]
  before_action :authenticate_admin!

  def index
    @surveys = Survey.order('updated_at DESC').page(params[:page])
  end

  def show; end

  def new
    @survey = Survey.new
  end

  def edit; end

  def create
    @survey = Survey.new(survey_params)
    @survey.admin = current_admin
    if @survey.save
      redirect_to @survey, notice: 'Survey was successfully created.'
    else
      render :new
    end
  end

  def update
    @survey.admin = current_admin
    if @survey.update(survey_params)
      redirect_to @survey, notice: 'Survey was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @survey.destroy
    redirect_to survey_url, notice: 'Survey was successfully destroyed.'
  end

  private

  def set_survey
    @survey = Survey.find(params[:id])
  end

  def survey_params
    params.require(:survey).permit(:name, :admin_id,
                                   questions_attributes: [:id, :body, :_destroy, { answers_attributes: %i[id body correct _destroy] }])
  end
end
