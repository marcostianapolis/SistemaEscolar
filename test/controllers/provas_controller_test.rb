require 'test_helper'

class ProvasControllerTest < ActionController::TestCase
  setup do
    @prova = provas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:provas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create prova" do
    assert_difference('Prova.count') do
      post :create, prova: { aluno_id: @prova.aluno_id, materia_id: @prova.materia_id, nota1: @prova.nota1, nota2: @prova.nota2, nota3: @prova.nota3, nota4: @prova.nota4 }
    end

    assert_redirected_to prova_path(assigns(:prova))
  end

  test "should show prova" do
    get :show, id: @prova
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @prova
    assert_response :success
  end

  test "should update prova" do
    patch :update, id: @prova, prova: { aluno_id: @prova.aluno_id, materia_id: @prova.materia_id, nota1: @prova.nota1, nota2: @prova.nota2, nota3: @prova.nota3, nota4: @prova.nota4 }
    assert_redirected_to prova_path(assigns(:prova))
  end

  test "should destroy prova" do
    assert_difference('Prova.count', -1) do
      delete :destroy, id: @prova
    end

    assert_redirected_to provas_path
  end
end
