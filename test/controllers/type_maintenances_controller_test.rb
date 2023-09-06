require "test_helper"

class TypeMaintenancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @type_maintenance = type_maintenances(:one)
  end

  test "should get index" do
    get type_maintenances_url
    assert_response :success
  end

  test "should get new" do
    get new_type_maintenance_url
    assert_response :success
  end

  test "should create type_maintenance" do
    assert_difference("TypeMaintenance.count") do
      post type_maintenances_url, params: { type_maintenance: { maintenance_id: @type_maintenance.maintenance_id, name: @type_maintenance.name } }
    end

    assert_redirected_to type_maintenance_url(TypeMaintenance.last)
  end

  test "should show type_maintenance" do
    get type_maintenance_url(@type_maintenance)
    assert_response :success
  end

  test "should get edit" do
    get edit_type_maintenance_url(@type_maintenance)
    assert_response :success
  end

  test "should update type_maintenance" do
    patch type_maintenance_url(@type_maintenance), params: { type_maintenance: { maintenance_id: @type_maintenance.maintenance_id, name: @type_maintenance.name } }
    assert_redirected_to type_maintenance_url(@type_maintenance)
  end

  test "should destroy type_maintenance" do
    assert_difference("TypeMaintenance.count", -1) do
      delete type_maintenance_url(@type_maintenance)
    end

    assert_redirected_to type_maintenances_url
  end
end
