require 'test_helper'

class ListingDonesTest < ActionDispatch::IntegrationTest
  setup do
    Todo.create!(title: "Paint the fence", done_at: 1.day.ago)
    Todo.create!(title: "Feed the cat", done_at: nil)
  end

  test 'list dones (finished todos)' do
    get '/dones', {}, { 'Accept' => 'application/json' }

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    assert_equal 1, json(response.body).size
  end
end
