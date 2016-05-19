require 'test_helper'

class CreatingTodosTest < ActionDispatch::IntegrationTest
  test 'creates new todos' do
    post '/todos', {
        todo: {
          title: 'Buy extra chocolate',
          priority: 5
        }
      }.to_json,
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    todo = json(response.body)
    assert_equal todo_url(todo[:id]), response.location

    assert_equal 'Buy extra chocolate', todo[:title]
    assert_equal 5, todo[:priority]
  end
end
