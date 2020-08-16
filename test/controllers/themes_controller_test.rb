require 'test_helper'

class ThemesControllerTest < ActionDispatch::IntegrationTest
  test "should get root" do 
    get root_url
    assert_response :success
  end

  test "should get show" do
    get theme_path(@theme)
    assert_response :success
  end

  test "should get new" do
    get new_theme_path
    assert_response :success
  end

  test "should get create" do
    post themes_path
    assert_response :success
  end

  test "should get edit" do
    get edit_theme_path
    assert_response :success
  end

  test "should get update" do
    patch theme_path(@theme)
    assert_response :success
  end

  test "should get destroy" do
    get themes_destroy_url
    assert_response :success
  end

end
