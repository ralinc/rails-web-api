class DonesController < ApplicationController
  def index
    dones = Todo.where('done_at IS NOT NULL')
    render json: dones, status: 200
  end
end
