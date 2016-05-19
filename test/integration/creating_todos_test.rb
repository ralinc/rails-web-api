require 'test_helper'

class CreatingTodosTest < ActionDispatch::IntegrationTest
  test 'creates new todos with valid json' do
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

  test 'does not create todos with invalid json' do
    post '/todos', {
        todo: {
          title: nil,
          priority: 5
        }
      }.to_json,
      {
        'Accept' => 'application/json',
        'Content-Type' => 'application/json'
      }

    assert_equal 422, response.status
  end
end
