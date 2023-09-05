require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get inicio" do
    get pages_inicio_url
    assert_response :success
  end

  test "should get terminos" do
    get pages_terminos_url
    assert_response :success
  end
end
