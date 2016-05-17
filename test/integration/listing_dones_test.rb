require 'test_helper'

class ListingDonesTest < ActionDispatch::IntegrationTest
  test 'list dones (finished todos)' do
    get '/dones', {}, { 'Accept' => 'application/json' }

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
