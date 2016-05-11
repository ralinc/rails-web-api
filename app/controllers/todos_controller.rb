class TodosController < ApplicationController
  def index
    todos = Todo.all

    if priority = params[:priority]
      todos = todos.where(priority: priority)
    end

    render json: todos, status: 200
  end
end
