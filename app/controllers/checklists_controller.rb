# frozen_string_literal: true

class ChecklistsController < ApplicationController
  before_action :find_checklist, only: %i[show edit update destroy]

  def index
    if user_signed_in?
      @checklists = Checklist.where(user_id: current_user.id)
                 .order(id: :desc).paginate(page: params[:page], per_page: 10)
    end
  end

  def new
    @checklist = Checklist.new
    3.times { @checklist.questions.build }
  end

  def show; end

  def create
    @checklist = Checklist.new(checklist_params)
    @checklist.user_id = current_user.id if current_user
    if @checklist.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @checklist.update(checklist_params)
      redirect_to checklist_path(@checklist)
    else
      redner 'edit'
    end
  end

  def destroy
    @checklist.destroy
    redirect_to root_path
  end

  private

  def checklist_params
    params.require(:checklist).permit(:title, :description)
  end

  def find_checklist
    @checklist = Checklist.find(params[:id])
  end
end
