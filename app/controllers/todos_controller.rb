class TodosController < ApplicationController
  before_action :set_todo, only: [:edit]

  def index
    @todos = Todo.all
  end

  def edit
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
