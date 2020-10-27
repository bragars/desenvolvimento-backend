require 'test_helper'

class StateTimesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @state_time = state_times(:one)
  end

  test "should get index" do
    get state_times_url, as: :json
    assert_response :success
  end

  test "should create state_time" do
    assert_difference('StateTime.count') do
      post state_times_url, params: { state_time: { cases: @state_time.cases, date: @state_time.date, deaths: @state_time.deaths, state: @state_time.state, uf: @state_time.uf } }, as: :json
    end

    assert_response 201
  end

  test "should show state_time" do
    get state_time_url(@state_time), as: :json
    assert_response :success
  end

  test "should update state_time" do
    patch state_time_url(@state_time), params: { state_time: { cases: @state_time.cases, date: @state_time.date, deaths: @state_time.deaths, state: @state_time.state, uf: @state_time.uf } }, as: :json
    assert_response 200
  end

  test "should destroy state_time" do
    assert_difference('StateTime.count', -1) do
      delete state_time_url(@state_time), as: :json
    end

    assert_response 204
  end
end
