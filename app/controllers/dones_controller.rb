class DonesController < ApplicationController
  def index
    dones = Todo.completed
    render json: dones, status: 200
  end
end
