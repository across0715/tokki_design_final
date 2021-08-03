require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Tokki Design"
  end

  test "should get home" do
    get home_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get gallery" do
    get gallery_url
    assert_response :success
    assert_select "title", "Gallery | #{@base_title}"
  end

  test "should get faq" do
    get faq_url
    assert_response :success
    assert_select "title", "faq | #{@base_title}"
  end
end
