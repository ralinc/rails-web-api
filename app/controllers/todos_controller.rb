class TodosController < ApplicationController
  def index
    todos = Todo.all

    if priority = params[:priority]
      todos = todos.where(priority: priority)
    end

    render json: todos, status: 200
  end

  def create
    todo = Todo.create(todo_params)

    if todo.save
      render json: todo, status: 201, location: todo
    else
      render json: todo.errors, status: 422
    end
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy!

    render nothing: true, status: 204
  end

  private

    def todo_params
      params.require(:todo).permit(:title, :priority)
    end
end
