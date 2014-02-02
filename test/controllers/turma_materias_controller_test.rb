require 'test_helper'

class TurmaMateriasControllerTest < ActionController::TestCase
  setup do
    @turma_materia = turma_materias(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:turma_materias)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create turma_materia" do
    assert_difference('TurmaMateria.count') do
      post :create, turma_materia: { materia_id: @turma_materia.materia_id, turma_id: @turma_materia.turma_id }
    end

    assert_redirected_to turma_materia_path(assigns(:turma_materia))
  end

  test "should show turma_materia" do
    get :show, id: @turma_materia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @turma_materia
    assert_response :success
  end

  test "should update turma_materia" do
    patch :update, id: @turma_materia, turma_materia: { materia_id: @turma_materia.materia_id, turma_id: @turma_materia.turma_id }
    assert_redirected_to turma_materia_path(assigns(:turma_materia))
  end

  test "should destroy turma_materia" do
    assert_difference('TurmaMateria.count', -1) do
      delete :destroy, id: @turma_materia
    end

    assert_redirected_to turma_materias_path
  end
end
