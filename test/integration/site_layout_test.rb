require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", parties_path
    assert_select "a[href=?]", battles_path
    assert_select "a[href=?]", stats_show_path
  end
end
