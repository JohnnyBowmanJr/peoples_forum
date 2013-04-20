require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
 	
	setup do
    @suggestion = Suggestion.make!
    @comment = @suggestion.comments.make!
  end

	test "should get index" do
		get :index, {:suggestion_id => @suggestion.id}
	
		assert_response :success
		assert_not_nil assigns(:comments)
	end

	test "should create comment" do
    assert_difference('Comment.count') do
      post :create, {:comment => {:body =>"I am a comment"}, :suggestion_id => @suggestion.id}
    end
    assert_equal assigns(:comment).body, "I am a comment"
    assert_redirected_to suggestion_comments_path
  end 

  test "should get edit" do
    get :edit, {:suggestion_id => @suggestion.id, :id => @comment.id}
    assert_response :success
  end

  test "should update comment" do
    put :update, {:suggestion_id => @suggestion.id, :id => @comment.id}
    assert_redirected_to suggestion_comments_path(assigns(:comment))

  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete :destroy, {:suggestion_id => @suggestion.id}
    end

    assert_redirected_to suggestion_comments_path(@suggestion)
  end



	#test that right instance variable is getting passed between controllers and views

	#test that pages works

end
