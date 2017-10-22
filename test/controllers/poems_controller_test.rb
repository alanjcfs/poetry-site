require 'test_helper'

class PoemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  # test "should get new" do
  #   get :new
  #   assert_response :success
  # end

  # test "should create poem" do
  #   assert_difference('Poem.count') do
  #     post :create, poem: { johnson: @poem.johnson, text: @poem.text }
  #   end

  #   assert_redirected_to poem_path(assigns(:poem))
  # end

  test "should show poem" do
    @poem = poems(:one)
    get :show, params: { id: @poem.id }
    assert_response :success
  end

  # test "should get edit" do
  #   get :edit, id: @poem
  #   assert_response :success
  # end

  # test "should update poem" do
  #   put :update, id: @poem, poem: { johnson: @poem.johnson, text: @poem.text }
  #   assert_redirected_to poem_path(assigns(:poem))
  # end

  # test "should destroy poem" do
  #   assert_difference('Poem.count', -1) do
  #     delete :destroy, id: @poem
  #   end

  #   assert_redirected_to poems_path
  # end
end
