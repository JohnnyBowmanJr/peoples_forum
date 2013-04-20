require 'test_helper'

class SuggestionsControllerTest < ActionController::TestCase
  setup do
    @suggestion = Suggestion.make!
    @comment = Comment.make!
    @suggestion.comments.make!
  end

  test "should get index" do
    get :index
    assert_response :success
    #this asserts that @suggestions is not nil. Assigns passes @suggestions
    #without creating it. When it hits index, which requiress @suggestions, it'll
    #see if @suggestions is not nil.
    assert_not_nil assigns(:suggestions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create suggestion" do
    assert_difference('Suggestion.count') do
      post :create, suggestion: {  }
    end

    assert_equal('/suggestions', request.fullpath)
  end 

  test "should get edit" do
    get :edit, id: @suggestion
    assert_response :success
  end

  test "should update suggestion" do
    put :update, id: @suggestion, suggestion: {  }
    assert_redirected_to suggestion_comments_path(assigns(:suggestion))
  end

  test "should destroy suggestion" do
    assert_difference('Suggestion.count', -1) do
      delete :destroy, id: @suggestion
    end

    assert_redirected_to suggestions_path
  end
end
