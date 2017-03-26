require 'test_helper'

class EnrrolmentsControllerTest < ActionController::TestCase
  setup do
    @enrrolment = enrrolments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:enrrolments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create enrrolment" do
    assert_difference('Enrrolment.count') do
      post :create, enrrolment: { Student_id: @enrrolment.Student_id, Team_id: @enrrolment.Team_id, date_enrrolment: @enrrolment.date_enrrolment }
    end

    assert_redirected_to enrrolment_path(assigns(:enrrolment))
  end

  test "should show enrrolment" do
    get :show, id: @enrrolment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @enrrolment
    assert_response :success
  end

  test "should update enrrolment" do
    patch :update, id: @enrrolment, enrrolment: { Student_id: @enrrolment.Student_id, Team_id: @enrrolment.Team_id, date_enrrolment: @enrrolment.date_enrrolment }
    assert_redirected_to enrrolment_path(assigns(:enrrolment))
  end

  test "should destroy enrrolment" do
    assert_difference('Enrrolment.count', -1) do
      delete :destroy, id: @enrrolment
    end

    assert_redirected_to enrrolments_path
  end
end
