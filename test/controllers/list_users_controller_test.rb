require 'test_helper'

class ListUsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get list_users_index_url
    assert_response :success
  end
end
