require 'test_helper'

class RentRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rent_request = rent_requests(:one)
  end

  test "should get index" do
    get rent_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_rent_request_url
    assert_response :success
  end

  test "should create rent_request" do
    assert_difference('RentRequest.count') do
      post rent_requests_url, params: { rent_request: { accepted: @rent_request.accepted, owner_id: @rent_request.owner_id, requester_id: @rent_request.requester_id, total_price: @rent_request.total_price } }
    end

    assert_redirected_to rent_request_url(RentRequest.last)
  end

  test "should show rent_request" do
    get rent_request_url(@rent_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_rent_request_url(@rent_request)
    assert_response :success
  end

  test "should update rent_request" do
    patch rent_request_url(@rent_request), params: { rent_request: { accepted: @rent_request.accepted, owner_id: @rent_request.owner_id, requester_id: @rent_request.requester_id, total_price: @rent_request.total_price } }
    assert_redirected_to rent_request_url(@rent_request)
  end

  test "should destroy rent_request" do
    assert_difference('RentRequest.count', -1) do
      delete rent_request_url(@rent_request)
    end

    assert_redirected_to rent_requests_url
  end
end
