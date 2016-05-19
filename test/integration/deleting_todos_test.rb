require 'test_helper'

class DeletingTodosTest < ActionDispatch::IntegrationTest
  setup do
    @todo = Todo.create(title: 'Pick up the kids', priority: 1)
  end

  test 'delete todos' do
    delete "/todos/#{@todo.id}"

    assert_equal 204, response.status
  end
end
