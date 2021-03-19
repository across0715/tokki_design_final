require "test_helper"

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  test "should redirect destroy for wrong micropost" do
    log_in_as(users(:michael))
    micropost = microposts(:ants)
    assert_no_difference "Micropost.count" do
      delete micropost_path(micropost)
    end
    assert_redirected_to root_url
  end
end
