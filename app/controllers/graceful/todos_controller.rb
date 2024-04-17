class Graceful::TodosController < ApplicationController
  before_action :set_todo, only: %i[edit update destroy]

  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      respond_to do |format|
        format.html { redirect_to graceful_todos_path, notice: "TODO was successfully created." }
        format.turbo_stream
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      respond_to do |format|
        format.html { redirect_to graceful_todos_path, notice: "TODO was successfully updated." }
        format.turbo_stream
      end
    else
      render :edit
    end
  end

  def destroy
    @todo.destroy
    respond_to do |format|
      format.html { redirect_to graceful_todos_path, notice: "TODO was successfully destroyed." }
      format.turbo_stream
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
