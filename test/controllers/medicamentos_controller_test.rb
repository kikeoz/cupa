require 'test_helper'

class MedicamentosControllerTest < ActionController::TestCase
  setup do
    @medicamento = medicamentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicamentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicamento" do
    assert_difference('Medicamento.count') do
      post :create, medicamento: { med_id: @medicamento.med_id, med_linea: @medicamento.med_linea, med_nombre: @medicamento.med_nombre }
    end

    assert_redirected_to medicamento_path(assigns(:medicamento))
  end

  test "should show medicamento" do
    get :show, id: @medicamento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicamento
    assert_response :success
  end

  test "should update medicamento" do
    patch :update, id: @medicamento, medicamento: { med_id: @medicamento.med_id, med_linea: @medicamento.med_linea, med_nombre: @medicamento.med_nombre }
    assert_redirected_to medicamento_path(assigns(:medicamento))
  end

  test "should destroy medicamento" do
    assert_difference('Medicamento.count', -1) do
      delete :destroy, id: @medicamento
    end

    assert_redirected_to medicamentos_path
  end
end
