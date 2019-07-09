require 'test_helper'

class JapansControllerTest < ActionDispatch::IntegrationTest
  setup do
    @japan = japans(:one)
  end

  test "should get index" do
    get japans_url
    assert_response :success
  end

  test "should get new" do
    get new_japan_url
    assert_response :success
  end

  test "should create japan" do
    assert_difference('Japan.count') do
      post japans_url, params: { japan: {  } }
    end

    assert_redirected_to japan_url(Japan.last)
  end

  test "should show japan" do
    get japan_url(@japan)
    assert_response :success
  end

  test "should get edit" do
    get edit_japan_url(@japan)
    assert_response :success
  end

  test "should update japan" do
    patch japan_url(@japan), params: { japan: {  } }
    assert_redirected_to japan_url(@japan)
  end

  test "should destroy japan" do
    assert_difference('Japan.count', -1) do
      delete japan_url(@japan)
    end

    assert_redirected_to japans_url
  end
end
