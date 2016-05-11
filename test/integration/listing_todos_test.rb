require 'test_helper'

class ListingTodosTest < ActionDispatch::IntegrationTest
  setup do
    Todo.create!(title: 'Buy bread and butter', priority: 1)
    Todo.create!(title: 'Wash the dishes', priority: 3)
    Todo.create!(title: 'Watch the game tonight', priority: 5)
  end

  test 'listing todos' do
    get '/todos'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal Todo.count, json(response.body).size
  end

  test 'list top priority todos' do
    get '/todos?priority=5'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 1, json(response.body).size
  end
end
