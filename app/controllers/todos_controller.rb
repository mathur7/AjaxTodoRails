class TodosController < ApplicationController

  def index
    @todos = Todo.all
  end

  def new
    @todos = Todo.all
    @todo = Todo.new


  end

  def create
    @todo = Todo.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.json { render json: @todo, status: :created, location: @todo }
      else
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end

  end

  private
  def todo_params
    params.require(:todo).permit(:title, :description)
  end

end
