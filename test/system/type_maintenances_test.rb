require "application_system_test_case"

class TypeMaintenancesTest < ApplicationSystemTestCase
  setup do
    @type_maintenance = type_maintenances(:one)
  end

  test "visiting the index" do
    visit type_maintenances_url
    assert_selector "h1", text: "Type maintenances"
  end

  test "should create type maintenance" do
    visit type_maintenances_url
    click_on "New type maintenance"

    fill_in "Maintenance", with: @type_maintenance.maintenance_id
    fill_in "Name", with: @type_maintenance.name
    click_on "Create Type maintenance"

    assert_text "Type maintenance was successfully created"
    click_on "Back"
  end

  test "should update Type maintenance" do
    visit type_maintenance_url(@type_maintenance)
    click_on "Edit this type maintenance", match: :first

    fill_in "Maintenance", with: @type_maintenance.maintenance_id
    fill_in "Name", with: @type_maintenance.name
    click_on "Update Type maintenance"

    assert_text "Type maintenance was successfully updated"
    click_on "Back"
  end

  test "should destroy Type maintenance" do
    visit type_maintenance_url(@type_maintenance)
    click_on "Destroy this type maintenance", match: :first

    assert_text "Type maintenance was successfully destroyed"
  end
end
