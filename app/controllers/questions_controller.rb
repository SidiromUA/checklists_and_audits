# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show edit update destroy]

  def index
    if user_signed_in?
      @questions = Question.where(user_id: current_user.id)
                 .order(id: :desc).paginate(page: params[:page], per_page: 10)
    end
  end

  def new
    @question = Question.new
  end

  def show; end

  def create
    @checklist = Checklist.find(params[:checklist_id])
    @question = @checklist.questions.create(question_params)
    @question.user_id = current_user.id if current_user
     if @question.save
      redirect_to checklists_path(@checklist)
     else
      render :new
    end
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to question_path(@question)
    else
      redner :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :description)
  end

  def find_question
    @question = Question.find(params[:id])
  end
end
