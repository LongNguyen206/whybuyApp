require "application_system_test_case"

class RentRequestsTest < ApplicationSystemTestCase
  setup do
    @rent_request = rent_requests(:one)
  end

  test "visiting the index" do
    visit rent_requests_url
    assert_selector "h1", text: "Rent Requests"
  end

  test "creating a Rent request" do
    visit rent_requests_url
    click_on "New Rent Request"

    fill_in "Accepted", with: @rent_request.accepted
    fill_in "Owner", with: @rent_request.owner_id
    fill_in "Requester", with: @rent_request.requester_id
    fill_in "Total Price", with: @rent_request.total_price
    click_on "Create Rent request"

    assert_text "Rent request was successfully created"
    click_on "Back"
  end

  test "updating a Rent request" do
    visit rent_requests_url
    click_on "Edit", match: :first

    fill_in "Accepted", with: @rent_request.accepted
    fill_in "Owner", with: @rent_request.owner_id
    fill_in "Requester", with: @rent_request.requester_id
    fill_in "Total Price", with: @rent_request.total_price
    click_on "Update Rent request"

    assert_text "Rent request was successfully updated"
    click_on "Back"
  end

  test "destroying a Rent request" do
    visit rent_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Rent request was successfully destroyed"
  end
end
