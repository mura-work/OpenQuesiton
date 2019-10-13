require 'test_helper'

class FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get _favorite" do
    get favorites__favorite_url
    assert_response :success
  end

end
