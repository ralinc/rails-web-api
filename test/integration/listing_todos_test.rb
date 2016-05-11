require 'test_helper'

class ListingTodosTest < ActionDispatch::IntegrationTest
  test 'listing todos' do
    get '/todos'
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
