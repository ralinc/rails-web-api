require 'test_helper'

class ListingTodosTest < ActionDispatch::IntegrationTest
  setup do
    Todo.create!(title: 'Buy bread and butter', priority: 1)
    Todo.create!(title: 'Watch the game tonight', priority: 5)
  end

  test 'listing todos' do
    get '/todos'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal Todo.count, JSON.parse(response.body).size
  end
end
