class DonesController < ApplicationController
  def index
    todos = Todo.all
    render json: todos, status: 200
  end
end
