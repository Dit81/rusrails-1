require 'test_helper'

class NomenclaturesControllerTest < ActionController::TestCase
  setup do
    @nomenclature = nomenclatures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nomenclatures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nomenclature" do
    assert_difference('Nomenclature.count') do
      post :create, nomenclature: @nomenclature.attributes
    end

    assert_redirected_to nomenclature_path(assigns(:nomenclature))
  end

  test "should show nomenclature" do
    get :show, id: @nomenclature
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nomenclature
    assert_response :success
  end

  test "should update nomenclature" do
    put :update, id: @nomenclature, nomenclature: @nomenclature.attributes
    assert_redirected_to nomenclature_path(assigns(:nomenclature))
  end

  test "should destroy nomenclature" do
    assert_difference('Nomenclature.count', -1) do
      delete :destroy, id: @nomenclature
    end

    assert_redirected_to nomenclatures_path
  end
end
