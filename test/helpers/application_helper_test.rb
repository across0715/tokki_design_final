require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title,         "Tokki Design"
    assert_equal full_title('Help'), "Help | Tokki Design"
  end
end
