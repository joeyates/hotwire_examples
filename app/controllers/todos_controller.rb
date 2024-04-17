class TodosController < ApplicationController
  before_action :set_todo, only: %i[edit update]

  def index
    @todos = Todo.all
  end

  def edit
  end

  def update
    if !@todo.update(todo_params)
      render :edit
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name)
  end
end
